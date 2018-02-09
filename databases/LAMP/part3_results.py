#!/usr/local/bin/python3

# -*- coding: utf-8 -*-

import cgi, cgitb
cgitb.enable()

import sys, codecs
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())

import pymysql
import os
from part2_creds import *

form = cgi.FieldStorage()
boro = form["boro"].value
order   = form["order"].value

query  = '''SELECT m.mon_img, m.mon_name, p.park_name, b.boro_name, m.mon_url, m.mon_desc
            FROM monuments m
            INNER JOIN parks p on m.mon_park = p.park_name
            INNER JOIN boroughs b on p.park_boro = b.boro_name
            {}
            ORDER BY {};
        '''.format(boro,order)

connection = pymysql.connect(host,user,passwd,db,charset="utf8mb4",cursorclass=pymysql.cursors.DictCursor)
c =connection.cursor()
c.execute(query)

r = c.fetchall()

print("Content-Type: text/html\r\n\r\n")
print("<html>")
print("<head>")
print("<title>LAMP Webpage</title>")
print('''<link rel="stylesheet" type="text/css" href="../main.css" >''')
print("</head>")
print("<body>")
print('<h3 class="fixed">LAMP Assignment</h4>')
#print("<hr />")
print('<div id="container">')
print('<div id="header">')
print('<h2> Assignment 7: A LAMP Website for MySQL Data </h2>')
print('<div id="bio"')
print('<p>These results display all the monuments that reside in NYC parks in a given borough.  Click on the image to read more on the NYC Parks website.</p>')

print("<p>Query: "+query+"</p>")
print("<a href='./index.html'>&#8592;make another query</a>")
print('</div>') #end div bio
print('</div>') #end div header
print('<p></p>')

print("<hr />")
#
print('<div id="info">')
#
# # Add to this print statement to include additional fields and display formatting:
for row in r:
    print('''<h3>{name}</h3>'''.format(name=row['mon_name']))
    print(''' {park}, {boro}<br/>'''.format(park=row['park_name'], boro=row['boro_name']))
    print('''<br/><a href = "{url}"><img src="./images/{image}" width=300></a><br/><br/>'''.format(image=row['mon_img'],url=row['mon_url']))
    print('''{desc}<hr>'''.format(desc=row['mon_desc']))


    # {'mon_img': 'island.jpg', 'mon_name': 'City Island World War Memorial', 'park_name': 'City Island Park', 'boro_name': 'the Bronx', 'mon_url': 'https://www.nycgovparks.org/parks/hawkins-park/monuments/253'}

print("<a href='./index.html'>&#8592;make another query</a>")

print('</div>')#end div info
print("</body>")
print('</div>')
print("</html>")

# # close the  connection
c.close()
