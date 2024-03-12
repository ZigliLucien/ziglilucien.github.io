#!/bin/bash

cd /home/p/NET/METAR

/home/p/NET/METAR/GetWeather.xml

/home/p/NET/METAR/weatherinfo  KMDH

/home/p/NET/METAR/grapher /home/p/NET/METAR/KMDH.aux

/home/p/NET/METAR/cleanupfiles

touch /home/p/NET/METAR/KMDH*

/usr/bin/xsltproc  -o /home/p/NET/METAR/weather.html /home/p/NET/METAR/weather.xsl /home/p/NET/METAR/wthr.xml

