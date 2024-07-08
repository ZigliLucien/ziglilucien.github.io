#!/usr/bin/env python3

import requests
import json


data = requests.get("https://api.weather.gov/gridpoints/PAH/107,82/forecast").json()

zout = open("/home/pi/WeatherNotes/fcast.json","w")
json.dump(data,zout)
zout.close()


data=requests.get("https://api.weather.gov/alerts/active?zone=ILZ084").json()

zout = open("/home/pi/WeatherNotes/alert.json","w")
json.dump(data,zout)
zout.close()



