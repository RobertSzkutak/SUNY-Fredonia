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
import cgi
import string

form = '<form method="post"><textarea name="text" style="height: 100px; width: 400px;">%(textsub)s</textarea><br><input type="submit"></form>'

def ROT13(text):
    return cgi.escape(text.encode('rot13'), quote=True)

class MainHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write(form % {"textsub" : ""})

    def post(self):
        user_text = self.request.get('text')
        text = ROT13(user_text)
        self.response.out.write(form % {"textsub" : text})

app = webapp2.WSGIApplication([('/', MainHandler)],
                              debug=True)
