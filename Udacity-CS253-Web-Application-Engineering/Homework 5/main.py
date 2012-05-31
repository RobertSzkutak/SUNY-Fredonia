
#
# Copyright 2007 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
import os
import cgi
import webapp2
import re
import hashlib
import random
import string
import json
from google.appengine.ext import db

USER_RE = re.compile(r"^[a-zA-Z0-9_-]{3,20}$")
EMAIL_RE = re.compile("^[\S]+@[\S]+\.[\S]+$")
PASS_RE = re.compile("^.{3,20}$")

def valid_user(user):
    return USER_RE.match(user)

def valid_pass(password):
    return PASS_RE.match(password)

def valid_email(email):
    return EMAIL_RE.match(email)

def pass_match(password, verify):
    if password == verify:
        return 1
    return 0

def make_salt():
    return ''.join(random.choice(string.letters) for x in xrange(5))

def make_password_hash(name, pw, salt):
    return salt + '|' + hashlib.sha256(name + pw + salt).hexdigest()

blog = """
        <html>
        <head>
            <title>Rob's Blog</title>
        </head>
        <body>
        <h1 style="text-align:center">Rob's Blog</h1>"""

subject = content = error = ""

newpost = """
            <html>
                <head>
                    <title>Rob's Blog</title>
                </head>
            <body>
            <div style="text-align:center">
                <h1>New Post</h1>
                <form method="post">
                    <input type="text" name="subject" value="%(subject)s"><br/>
                    <textarea name="content">%(content)s</textarea><br/>
                    <input type="submit"><br/>
                </form>
                <h2>%(error)s</h2>
            </div>
            </body>
            </html>"""

post = """
       <html>
       <head>
           <title>Rob's Blog</title>
       </head>
       <body>
       <h2 style="text-align: center">%(subject)s</h2>
       <br/>
       %(content)s
       <br/>
       %(date)s
       </body>
       </html>
       """

signup = """
       <html>
       <head>
           <title>Rob's Blog</title>
       </head>
       <body>
        <h2>Signup</h2>
        <form method="post">
            <table>
                <tr>
                    <td class="label">Username</td>
                    <td><input type="text" name="username" value="%(user)s"></td>
                    <td class="error">%(usererror)s</td>
                </tr>
                <tr>
                    <td class="label">Password</td>
                    <td><input type="password" name="password" value=""></td>
                    <td class="error">%(passerror)s</td></tr><tr><td class="label">Verify Password</td>
                    <td><input type="password" name="verify" value=""></td><td class="error">%(verifyerror)s</td>
                </tr>
                <tr>
                    <td class="label">Email (optional)</td>
                    <td><input type="text" name="email" value="%(email)s"></td>
                    <td class="error">%(emailerror)s</td>
                </tr>
            </table>
            <input type="submit">
        </form>
       </body>
       </html>
        """

login = """
       <html>
       <head>
           <title>Rob's Blog</title>
       </head>
       <body>
        <h2>Login</h2>
        <form method="post">
            <table>
                <tr>
                    <td class="label">Username</td>
                    <td><input type="text" name="username" value="%(user)s"></td>
                </tr>
                <tr>
                    <td class="label">Password</td>
                    <td><input type="password" name="password" value=""></td>
                </tr>
            </table>
            %(error)s
            <input type="submit">
        </form>
       </body>
       </html>
        """

#Database for posts
class Blog(db.Model):
    subject = db.StringProperty(required = True)
    content = db.TextProperty(required = True)
    date = db.DateTimeProperty(auto_now_add = True)

    def as_dict(self):
        time_fmt = '%c'
        d = {'subject': self.subject,
             'content': self.content,
             'created': self.date.strftime(time_fmt)}
        return d

#Database for users
class Users(db.Model):
    username = db.StringProperty(required = True)
    password = db.StringProperty(required = True)
    email = db.StringProperty()
    
#Handler for the main page of the blog
class MainHandler(webapp2.RequestHandler):

    def writeBlog(self):
        dbposts = db.GqlQuery("SELECT * FROM Blog ORDER BY date DESC")
        i = 0
        try:
            posts = ""
            for each in dbposts:
                posts += """
                        <h2 style="text-align: center">""" + str(each.subject) + """</h2>
                        <br/>
                        """ + str(each.content) + """
                        <br/>
                        """ + str(each.date) + """
                    """
                i += 1
                if i > 9:
                    break#Only show last 10 most recent blog posts
        except:
            posts= "EXCEPTION OCCURED!"
        self.response.out.write(blog + posts + "</body></html>")
    
    def get(self):
        if self.request.url.endswith('.json'):
            self.format = 'json'
        else:
            self.format = 'html'
        if self.format == 'json':
            self.response.headers['Content-Type'] = 'application/json; charset=UTF-8'
            dbposts = db.GqlQuery("SELECT * FROM Blog ORDER BY date DESC")
            i = 0
            r = '['
            for each in dbposts:
                json_txt = json.dumps(each.as_dict())
                r += json_txt
                r += ', '
                i += 1
                if i > 9:
                    break#Only show last 10 most recent blog posts
            r = r[:-2] + ']'
            self.response.out.write(r)
        if self.format == 'html':
            self.writeBlog()

#Handler for making a new blog post
class NewPostHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write(newpost % { "subject" : subject, "content": content, "error": ""} )

    def post(self):
        subject = cgi.escape(self.request.get('subject'), quote=True)
        content = cgi.escape(self.request.get('content'), quote=True)
        if subject and content:
            b = Blog(subject = subject, content = content)
            key = b.put()
            self.redirect('/' + str(key.id()))
        else:
            self.response.out.write(newpost % { "subject" : subject, "content": content, "error": "You need a subject and a title to post!"} )

#Handler for looking up a post by id
class PostHandler(webapp2.RequestHandler):
    def get(self, postid):
        if self.request.url.endswith('.json'):
            self.format = 'json'
        else:
            self.format = 'html'
        p = Blog.get_by_id(int(postid))
        if not p:
            self.error(404)
            return
        if self.format == 'html':
            self.response.out.write(post % { "subject" : str(p.subject), "content": str(p.content), "date": str(p.date)} )
        if self.format == 'json':
            json_txt = json.dumps(p.as_dict())
            self.response.headers['Content-Type'] = 'application/json; charset=UTF-8'
            self.response.out.write(json_txt)

class SignupHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write(signup % {"user" : "", "email" : "", "usererror" : "", "passerror" : "", "verifyerror" : "", "emailerror" : ""})

    def post(self):
        error = 0
        user = self.request.get('username')
        password = self.request.get('password')
        verify = self.request.get('verify')
        email = self.request.get('email')

        usererror = ""
        passerror = ""
        verifyerror = ""
        emailerror = ""

        if not valid_user(user):
            error = 1
            usererror = "That's not a valid username."

        if not valid_pass(password):
            error = 1
            passerror = "That wasn't a valid password."

        if valid_pass(password) and pass_match(password, verify) == 0:
            error = 1
            verifyerror = "Your passwords didn't match."

        if len(email) > 0 and not valid_email(email):
            error = 1
            emailerror = "That's not a valid email."

        dbusers = db.GqlQuery("SELECT * FROM Users")
        try:
            for each in dbusers:
                if each.username == user:
                    error = 1
                    usererror = "That username already exists."
        except:
            if error == 0:
                error = 0
        
        if error == 0:
            salt = make_salt()
            password = make_password_hash(user, password, salt)
            u = Users(username = user, password = password, email = email)
            u.put()
            self.response.headers.add_header('Set-Cookie', 'login=' + password + '; Path=/')
            self.redirect("/welcome")
        else:
            self.response.out.write(signup % {"user" : user, "email" : email, "usererror" : usererror, "passerror" : passerror, "verifyerror" : verifyerror, "emailerror" : emailerror})

class LoginHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write(login % {"user" : "", "error" : ""})

    def post(self):
        user = self.request.get('username')
        password = self.request.get('password')
        error = ""
        result = 0

        dbusers = db.GqlQuery("SELECT * FROM Users")
        
        for each in dbusers:
            if str(each.username) == str(user):
                salt = each.password[:each.password.find('|')]
                if make_password_hash(user, password, salt) == each.password:
                    self.response.headers.add_header('Set-Cookie', 'login=' + str(each.password) + '; Path=/')
                    result = 1
                else:
                    break
        
        if result == 1:
            self.redirect("/welcome")
        else:
            self.response.out.write(login % {"user" : "", "error" : "<p>Invalid login!</p>"})

class LogoutHandler(webapp2.RequestHandler):
    def get(self):
        self.response.headers.add_header('Set-Cookie', 'login=''; Path=/')
        self.redirect("/signup")

class WelcomeHandler(webapp2.RequestHandler):
    def get(self):
        cookie = self.request.cookies.get('login')
        salt = cookie[:cookie.find('|')]
        h = cookie[cookie.find('|')+1:]
        user = ""
        dbusers = db.GqlQuery("SELECT * FROM Users")
        try:
            for each in dbusers:
                if str(cookie) == str(each.password):
                    user = each.username
        except:
            self.redirect("/signup")
        if not user:
            self.redirect("/signup")
        self.response.out.write("Welcome, " + user + "!")

app = webapp2.WSGIApplication([('/?(?:.json)?', MainHandler), ('/welcome', WelcomeHandler), ('/signup', SignupHandler), ('/login', LoginHandler), ('/logout', LogoutHandler), ('/newpost', NewPostHandler), ('/([0-9]+)(?:.json)?', PostHandler)], debug=True)
