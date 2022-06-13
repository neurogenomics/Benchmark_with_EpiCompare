#!/project/soft/linux64/anaconda/Anaconda3-2019.10-Linux-x86_64/bin/python

import mysql.connector as mysql
import cgi

# --- Retrieve vlaues from HTML file

data=cgi.FieldStorage()
field1 = data.getvalue('field1')

# --- Open database connection

connection = mysql.connect(
     user      = 'memento',
     password  = 'memento',
     database  = 'memento',
     host      = 'ls-msc11.bc.ic.ac.uk'
)
cursor = connection.cursor()

# A simple query first

print("Content-type: text/html")
print("")
print("<html>")
print("<head>")
print("<b>Here is output from the MySQL query</b><br>")

cursor.execute("show databases")
mysql_output = cursor.fetchall()
for i in mysql_output:
     print(i,"<br>")

print("</head>")
print("</html>")

connection.close()

