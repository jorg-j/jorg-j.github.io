#!/bin/bash

sudo apt install webhook

cat << EOF > hooks.json
[
    {
        "id": "reload",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/reload.sh",
        "command-working-directory": "/home/jack/software/webhooks"
    },
    {
        "id": "jsonupdate",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/run-hook-update.sh",
        "command-working-directory": "/home/jack/software/webhooks"
    },
    {
        "id": "discord",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/send-to-discord.sh",
        "command-working-directory": "/home/jack/software/webhooks/bash-hooks/",
        "pass-arguments-to-command": [
            {
                "source": "url",
                "name": "user"
            },
            {
                "source": "url",
                "name": "msg"
            }
        ]
    },
    {
        "id": "start-cleanup",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/reddit-cleaner.sh",
        "command-working-directory": "/home/jack/software/webhooks/bash-hooks/",
        "response-message": "Landed"
    },
    {
        "id": "redditdl",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/reddit-downloader.sh",
        "command-working-directory": "/home/jack/software/webhooks/bash-hooks/",
        "response-message": "Downloader triggered"
    },
    {
        "id": "minidlna",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/minidlna_reload.sh",
        "command-working-directory": "/home/jack/software/webhooks/bash-hooks/",
        "response-message": "Triggered"
    },
    {
        "id": "reading",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/add_reading.sh",
        "command-working-directory": "/home/jack/software/webhooks/bash-hooks/",
        "pass-arguments-to-command": [
            {
                "source": "url",
                "name": "txt"
            }
        ],
        "response-message": "Triggered"
    },
    {
        "id": "issue",
        "execute-command": "/home/jack/software/webhooks/bash-hooks/add_issue.sh",
        "command-working-directory": "/home/jack/software/webhooks/bash-hooks/",
        "pass-arguments-to-command": [
            {
                "source": "url",
                "name": "txt"
            }
        ],
        "response-message": "Triggered"
    }
]
EOF

webhook -hooks $PWD/hooks.json
