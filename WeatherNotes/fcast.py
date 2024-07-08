#!/usr/bin/python3

from json2xml import json2xml
from json2xml.utils import readfromurl, readfromstring, readfromjson

# get the xml from an URL that return json
data = readfromurl("https://api.weather.gov/gridpoints/PAH/107,81/forecast")
z = json2xml.Json2xml(data).to_xml()


out = open("/home/ph/WeatherNotes/fcast.xml","w")
out.write(z)
out.close()
