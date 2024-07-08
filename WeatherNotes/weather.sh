#!/bin/bash

cd /home/ph/WeatherNotes

/home/pi/WeatherNotes/alert.py
java Query alert.xql alert.xml alert.md
/home/pi/WeatherNotes/fcast.py
java Query fcast.xql fcast.xml fcast.md
makepage fcast.md |./mathjaxfilterr > fcast.html
makepage alert.md |./mathjaxfilterr > alert.html

