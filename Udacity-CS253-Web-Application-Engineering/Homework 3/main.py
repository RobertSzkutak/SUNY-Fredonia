#!/usr/bin/env python
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
from google.appengine.ext import db

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

#Database
class Blog(db.Model):
    subject = db.StringProperty(required = True)
    content = db.TextProperty(required = True)
    date = db.DateTimeProperty(auto_now_add = True)
    
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
        self.writeBlog()

    def post(self):
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
        p = Blog.get_by_id(int(postid))
        self.response.out.write(post % { "subject" : str(p.subject), "content": str(p.content), "date": str(p.date)} )

app = webapp2.WSGIApplication([('/', MainHandler), ('/newpost', NewPostHandler), (r'/(\d+)', PostHandler)], debug=True)
