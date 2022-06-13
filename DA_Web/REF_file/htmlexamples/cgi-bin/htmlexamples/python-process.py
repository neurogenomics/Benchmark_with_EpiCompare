#!/project/soft/linux64/anaconda/Anaconda3-2020.11-Linux-x86_64/bin/python

# Let is explicitly define the path to our python.
# Should really use '#!/usr/bin/env python' but the user
# environment may not have that python in path by default

# Import libs for handeling CGI and os+sys

import os,sys
import cgi, cgitb
cgitb.enable()

# Just for convenience lets define functions to print
# the HTML header and footer. Saves us having to repeat
# these statement in main code, if they are needed 
# more than once

def MyHTMLHeader():
   print("Content-type:text/html\r\n\r\n")
   print("<html>")
   print("<head>")
   print("<title>Output from Python CGI Script</title>")
   print("</head>")
   print("<body>")

def MyHTMLFooter():
   print("</body>")
   print("</html>")

def MyPlotExample():
   import codecs
   import numpy as np
   import matplotlib
   import matplotlib.pyplot as plt
   sys.stdout = codecs.getwriter('utf8')(sys.stdout)
   matplotlib.use('Agg')
   os.environ['HOME'] = '/tmp'
   x = np.linspace(0.0, 5.0)
   y = np.cos(2 * np.pi * x) * np.exp(-x)
   plt.suptitle('A Simple Graph')
   plt.xlabel('Time(s)')
   plt.ylabel('Oscillations')
   plt.plot(x, y, 'o-')  
   print("Content-type: image/png\r\n\r\n")
   plt.savefig(codecs.getwriter('utf8')(sys.stdout), format='png')

# Create instance of FieldStorage 

MyForm = cgi.FieldStorage() 

# Get data from fields (sent by the HTML form)

Data_1 = MyForm.getvalue("MyDataType")
Data_2 = MyForm.getvalue("MyCode")

# I guess we should check what the user has sent is valid. If not then
# send error to Browser. To see error set IHaveError = 1

IHaveAnError = 0
if IHaveAnError == 1:
   MyHTMLHeader()
   print("<font color=red>")
   print("<h2>In Correct Value given.<br>")
   print("Please go back to page and enter a value value</h2>")
   print("</font>")
   MyHTMLFooter()
   sys.exit()

# All looks good, so send processed data back to html page
# Must print header first telling python that this is HTML content

MyHTMLHeader()
print("<font color=red>")
print("<h2>Your input values wewre ",Data_1," ",Data_2,"</h2>")
print("</font>")
print("<p>")

# Lets just plot a live graph. We do need access to a directory
# that the html daemon can write to. Best to use '/tmp'

MyPlotExample()

# Finally printthe HTML footer to formally close the page

MyHTMLFooter()





