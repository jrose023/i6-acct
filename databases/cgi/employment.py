#!/usr/local/bin/python3

# -*- coding: utf-8 -*-
"""
Created on Thu Oct 26 19:11:37 2017

@author: julie
"""

# python/cgi script for the employment html form
# variables coming from ./cgi/index.html: county, year, sortKey

# 8. Write the python script to retrieve the user's selections
#   along with running the query and to display the results.
#   
# a. receive the user selections from the HTML
# b. open a dynamic web page   
# c. several imports (e.g. sqlite, cgi, etc)
# d. run the query
# e. display the results of running the query
# f. close the database and finish up

import cgi
import sqlite3

import cgitb ## allow for debugging and good error message
cgitb.enable()

print("Content-Type: text/html\r\n\r\n")
print("<html>")
print("<head>")
print("<title>CGI + SQL Results</title>")
print('''<link rel="stylesheet" type="text/css" href="../main.css" >''')
print("</head>")
print("<body>")
print('<h3 class="fixed">Python + CGI + SQL</h4>')
#print("<hr />")
print('<div id="container">')
print('<div id="header">')
print('<h2> Assignment 5: A Website For SQLite Data </h2>')
print('<div id="bio"')
print('<p >These results display the industries with the highest wages in a given county during a given year.</p>')

# open the database next
# The name of the database is "employm.db"
# Set up the connection to the SQLite3 database:
conn = sqlite3.connect('employm.db')
c    = conn.cursor()

# retrieve our variables from the HTML form
# county - tracked by the county ID number
# quantity - number of records requested
# sortKey  - how the data will be sorted
form = cgi.FieldStorage()
user_county = form["county"].value
user_year = form["year"].value
user_sortKey  = form["sortKey"].value

# create the query:
query = "SELECT emp_industry, emp_avg_weekly, emp_avg_annual FROM emp WHERE emp_countyID = "
query += user_county + " AND emp_year = " + user_year + " ORDER BY "+user_sortKey 
print('<p>Query: '+query+'</p>\n')
#print("<hr />\n")
print('</div>') #end div bio
print('</div>') #end div header
print('<p></p>')

c.execute(query)

print('<div id="info">')
print("<table>")
print("<tr>")
print("\t<th>County</th>")
print("\t<th>" + str(user_year) + " Weekly Wage</th>")
print("\t<th>" + str(user_year) + " Annual Wage</th>")
print("</tr>")


# print the data
for emp_industry, emp_avg_weekly, emp_avg_annual in c:
    print("<tr>")
    print("\t<td>"+emp_industry+"</td>")
    print("\t<td>"+str(emp_avg_weekly)+"</td>")
    print("\t<td>"+str(emp_avg_annual)+"</td>")
    print("</tr>")
    
print("</table>\n")
c.close()
print('</div>')#end div info
print("</body>")
print('</div>')
print("</html>")



