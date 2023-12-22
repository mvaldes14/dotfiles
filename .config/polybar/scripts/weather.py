#!/usr/bin/python

import requests
import os

# Setup Data
city = "BloomingtonMn"
api_key = os.environ.get('WEATHER_API')
units = "Metric"
unit_key = "C"
URL = "http://api.openweathermap.org/data/2.5/weather?q={}&appid={}&units={}".format(city, api_key, units)
weather = ''


# Request
try:
    weather = requests.get(URL)
    weather_json = weather.json()
    # Weather Data
    if weather:
        info = weather_json['weather'][0]['description'].capitalize()
        temp = int(float(weather_json['main']['temp']))
        name = 'Bloomington'

        try:
            with open('$HOME/git/dotfiles/polybar/temp.txt', mode='w+') as file:
                file.write(f"{name} - {info}, {temp} °{unit_key}")
        except IOError as e:
            print('File does not exist')

except:
    pass


