---
title: ESP32 Flashing
layout: default
parent: ESP32 - ESP8266 Sensors
nav_order: 5
---

# ESP32 Flashing

Note: you can use an ESP8266 or an ESP32 for this, there are some slight changes but nothing major

This part assumes you are running Linux (Debian/Ubuntu). If you have a Windows OS then you will need to locate the information yourself.

We need software to flash the ESP with a new firmware

`pip install esptool`

`pip install adafruit-ampy`

To see the serial out we will need picocom

`sudo apt install picocom`

On some linux distro's the braile hardware library interupts our ability to flash certain USB devices. Unless you are using a braile device ie you are vision impaired. Then this can be removed.

`sudo apt remove brltty --purge`


# Flashing the Micropython Binaries


## Unpack the binaries


Binaries can be sourced directly from the links below

[ESP8266 - Micropython.org](https://micropython.org/download/esp8266/)

[ESP32 - Micropython.org](https://micropython.org/download/esp32/)

If they are not available the binaries can be downloaded here

[Download]({{ '/resources/ESP_binaries.zip' | relative_url }}){: .btn .btn-purple }

## Flashing Micropython

With the binaries now available run the following. Note: depending on the device you may need to hold the boot button or bridge the boot pin to ensure downloade mode is on

### ESP32
```
esptool.py --chip esp32 --port /dev/ttyUSB0 erase_flash
esptool.py --chip esp32 --port /dev/ttyUSB0 --baud 460800 write_flash -z 0x1000 esp32-20190125-v1.10.bin
```

### ESP8266
```
esptool.py --port /dev/ttyUSB0 erase_flash
esptool.py --port /dev/ttyUSB0 --baud 460800 write_flash --flash_size=detect 0 esp8266-20220618-v1.19.1.bin
```


## The Code

For this example I have connected a DS18B20 temperature sensor to GPIO 2, VIN and Ground.
Note lookup the pinout for your specific board.

![ESP32](/resources/ESP32-36-Pin-Pinout.jpg)




## Migrating Code

Cut the code you want to run then to move it to the ESP device.
Repeat the below for each file

```
ampy --port /dev/ttyUSB0 put $filename
```


## Inspecting 

To inspect running code
```
picocom /dev/ttyUSB0 -b115200
```