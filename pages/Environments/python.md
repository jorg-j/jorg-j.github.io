---
title: Python Virtual Environments
layout: default
parent: Setup Environments
nav_order: 2
---

# Python Virtual Environments


## Project Setup - Poetry

Create a project using 

`poetry new $ProjectName`


Given a project already exists and we need to add poetry

```
cd pre-existing-project
poetry init
```

Adding a package

`poetry add loguru`



Installing from a poetry.lock file

`poetry install`


Running

`poetry run python main.py`


Activate a shell

`poetry shell`



## Project Setup venv


Creating the environment

`python3 -m venv env`



Install requirements

`source /env/bin/activate && pip3 install -r requirements.txt`

