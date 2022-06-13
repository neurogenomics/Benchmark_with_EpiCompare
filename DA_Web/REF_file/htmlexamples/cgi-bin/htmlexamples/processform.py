#!/usr/bin/python

import cgi
import cgitb
cgitb.enable()

print "Content-type: text/html"

print
print "<html>"
print "Made contact with the python script","<br>"
print "Lets read the form:","<br>"
print "</html>"


formData = cgi.FieldStorage()
inputTitle = formData.getvalue("title")
inputFirst = formData.getvalue("firstname")
inputSurna = formData.getvalue("surname")
inputEmail = formData.getvalue("email")
inputInsti = formData.getvalue("institute")

# --- read tables of genes/diseases/....

# --- match entry with request from form

# --- output results for entry

print
print "<html>"
print "Title     ",inputTitle,"<br>"
print "First Name",inputFirst,"<br>"
print "Surname   ",inputSurna,"<br>"
print "Email     ",inputEmail,"<br>"
print "Institute ",inputInsti,"<br>"
print "</html>"

