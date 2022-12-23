---
title: ESP32 - ESP8266 Sensors
layout: default
nav_order: 4
has_children: true
---

# Micropython and the ESP32/8266 Microcontroller platform

Consumer grade sensors whilst easy to come at a cost. The Hue motion sensor is currently $70AUD for a motion sensor, temperature and humidity sensor.

Whilst this might be suitable for some it adds a large barrier of entry, and reduces scalability. One of the other challenges is the all or nothing approach of these types of sensors.

The Hue motion sensor has 3 sensors, PIR, Temperature, Humidity. However we may want only temperature, only motion or temperature and a magnetic switch. With consumer options we are limited by what the manufacturer is creating.

Another issue is data privacy. I am required to use the Hue Bridge with these sensors, the Hue application and their network. As such I have no governance over the data which is collected by Phillips.

This guide will be an evolving manual on setting up our own sensor array.


# Understanding the costs

To understand the cost variances I will evaluate the price of Hue hardware and "off the shelf" components. 

### Phillips

|Device|Purpose|Price (AUD)|
|---|---|---|
|Hue Bridge|Broker|99|
|Motion|Sensor|69|
||Total|168|

### Custom

|Device|Purpose|Price (AUD)|
|---|---|---|
|RPi ZeroW|Broker|25.36|
|SD Card|RPi OS|8|
|ESP32|Controller|7.51|
|DS18B20|Temperature Sensor|6.95|
||Total|47.82|

We can expand additional sensors to the ESP32 without adding additional controllers. However if we are to expand with an entirely new unit with new sensor it will cost $14.46 vs $69 for the Hue variant.
4 sensors for the price of 1

# Links

