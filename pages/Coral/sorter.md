---
title: Image Sorting - Google Coral
layout: default
parent: RPi TPU using Google Coral
nav_order: 4
---

# Image Sorting - Google Coral

## Installing

Run the following commands

```
sudo apt-get install libedgetpu1-std
sudo apt-get install python3-pycoral
```

Add the current user to the dialout group

```
sudo usermod -a -G dialout $USER
```

## Download the Project

[Download](resources/Coral_Sorter.zip){: .btn .btn-purple }

OR

`wget https://jorg-j.github.io/resources/Coral_Sorter.zip`

Extract the zip into a directory.

## Training the model

In the `training_data` directory create folders which represent the image types you wish to train. Then populate those directories with training data.

When ready to train run `bash menu.sh` and select `Run Training`

The model will be retained using the images within those directories and labelled using the directory names.

## Running the model

Populate the `feed` directory with images which need to be sorted.

When ready to classify run `bash menu.sh` and select `Run Classification`

Directories will be created in the `results` directory with your images sorted based on label.

Each image name and confidence score will be output to the terminal.