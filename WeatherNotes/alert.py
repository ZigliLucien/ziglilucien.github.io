#!/usr/bin/python3

from json2xml import json2xml
from json2xml.utils import readfromurl, readfromstring, readfromjson

# get the xml from an URL that return json
data=readfromurl("https://api.weather.gov/alerts/active?zone=ILZ084")
z = json2xml.Json2xml(data).to_xml()

# get the data from an URL
#data = readfromjson("/home/ph/WeatherNotes/alert.json")
#z = json2xml.Json2xml(data).to_xml()
#%store z >/home/ph/fcast.xml
out = open("/home/ph/WeatherNotes/alert.xml","w")
out.write(z)
out.close()

