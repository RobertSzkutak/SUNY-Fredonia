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
import webapp2
import re

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

form = '<h2>Signup</h2><form method="post"><table><tr><td class="label">Username</td><td><input type="text" name="username" value="%(user)s"></td><td class="error">%(usererror)s</td></tr>\
        <tr><td class="label">Password</td><td><input type="password" name="password" value=""></td><td class="error">%(passerror)s</td></tr><tr><td class="label">Verify Password\
        </td><td><input type="password" name="verify" value=""></td><td class="error">%(verifyerror)s</td></tr><tr><td class="label">Email (optional)</td><td><input type="text" name="email" value="%(email)s">\
        </td><td class="error">%(emailerror)s</td></tr></table><input type="submit"></form>'

class MainHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write(form % {"user" : "", "email" : "", "usererror" : "", "passerror" : "", "verifyerror" : "", "emailerror" : ""})

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
        
        if error == 0:
            self.redirect("/welcome?username=" + user)
        else:
            self.response.out.write(form % {"user" : user, "email" : email, "usererror" : usererror, "passerror" : passerror, "verifyerror" : verifyerror, "emailerror" : emailerror})

class WelcomeHandler(webapp2.RequestHandler):
    def get(self):
        user = self.request.get('username')
        self.response.out.write("Welcome, " + user + "!")

app = webapp2.WSGIApplication([('/', MainHandler), ('/welcome', WelcomeHandler)], debug=True)
