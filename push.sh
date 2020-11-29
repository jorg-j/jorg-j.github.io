#!/bin/bash

git pull --rebase

GITHUB_SSH_REPOSITORY_URL="git@github.com:jorg-j/jorg-j.github.io.git"
CommitMessage="Sync Changes"

function copyMoonlander {
    IMGPATH='/home/jack/Documents/Projects/moonlander-mk1/images/*'
    BINFILE='/home/jack/Documents/Projects/moonlander-mk1/moonlander_main.bin'
    RESOURCESPATH="/home/jack/Documents/Projects/jorg-j.github.io/resources/moonlander/"
    cp $IMGPATH $RESOURCESPATH
    cp $BINFILE $RESOURCESPATH
}

copyMoonlander

git add -u
git commit -m "$CommitMessage"
git remote add origin $GITHUB_SSH_REPOSITORY_URL
git push origin master
