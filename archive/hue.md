---
nav_exclude: true
---

## Hue

### Goal

To toggle a hue light using a webhook.

### Requirements

Webhook daemon, I am using [adnanh's webhook](https://github.com/adnanh/webhook)

Hue lights and hub

### Workflow

Send a webhook to `http://foo/hooks/hue`

Identify the light using URL parameters

`http://foo/hooks/hue?light=baa`

Then read the state of the light and toggle to opposite state.

### Limitations

The biggest limiter is the hue bridge requirement to press the bridge connect button.

This is not a show stopper but is annoying.

### Data Flow

I have found with the webhook daemon it is much easier to manage the hook using bash.

Due to this we will point the hook to a bash script which will send the URL paramater to python.

#### Hook

First is to add the hook information to the hooks.json file.
```
{
    "id": "hue",
    "execute-command": "/hue.sh",
    "command-working-directory": "path to dir",
    "pass-arguments-to-command": [
        {
            "source": "url",
            "name": "light"
        }
    ]
},
```
We see here the `"name": "light"` signifying the URL Param 

#### Bash Script

The bash script is named `hue.sh` and needs to be executeable

```
#!/usr/bin/env bash

python3 ./hue_control.py $1
```

Make Executeable

`sudo chmod +x hue.sh`

#### Python Code

For clarity sake I have attached the python code below.

[Code](resources/hue-lights/hue_control.py)

Within this we must change the IP to the IP of the hue bridge.

### Running the Code

We now need to setup the connection to the bridge and test the flow.

After pressing the bridge connect button run `./hue.sh Lamp`

The lamp should turn off/on

Now we can test the hook.

`http://foo/hooks/hue?light=Lamp`

