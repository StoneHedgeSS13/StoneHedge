#!/bin/bash

#Run this in the repo root after compiling
#First arg is path to where you want to deploy
#creates a work tree free of everything except what's necessary to run the game

#second arg is working directory if necessary
if [[ $# -eq 2 ]] ; then
  cd $2
fi

mkdir -p \
    $1/_maps \
    $1/icons/effects \
    $1/icons/mob/clothing \
    $1/icons/mob/inhands \
    $1/icons/obj \
    $1/strings \
    $1/modular_hearthstone/icons/obj \
    $1/modular_helmsguard/licensed-eaglephntm \
    $1/modular_helmsguard/licensed-feralope \
    $1/modular_stonehedge/licensed-eaglephntm \
    $1/modular_stonehedge/licensed-feralope \
    $1/modular_stonehedge/licensed-feralope \
    $1/modular_stonehedge/icons \

if [ -d ".git" ]; then
  mkdir -p $1/.git/logs
  cp -r .git/logs/* $1/.git/logs/
fi

cp roguetown.dmb roguetown.rsc $1/
cp -r _maps/* $1/_maps/
cp -r icons/*_title.dmi $1/icons/
cp -r icons/effects/* $1/icons/effects/
cp -r icons/mob/clothing/* $1/icons/mob/clothing/
cp -r icons/mob/inhands/* $1/icons/mob/inhands/
cp -r icons/roguetown/* $1/icons/roguetown/
cp -r icons/obj/* $1/icons/obj/
cp -r modular_hearthstone/icons/obj/* $1/modular_hearthstone/icons/obj/
cp -r modular_helmsguard/licensed-eaglephntm/* $1/modular_helmsguard/licensed-eaglephntm/
cp -r modular_helmsguard/licensed-feralope/* $1/modular_helmsguard/licensed-feralope/
cp -r modular_stonehedge/licensed-eaglephntm/* $1/modular_stonehedge/licensed-eaglephntm/
cp -r modular_stonehedge/licensed-feralope/* $1/modular_stonehedge/licensed-feralope/
cp -r modular_stonehedge/licensed-death-rattler/* $1/modular_stonehedge/licensed-feralope/
cp -r modular_stonehedge/icons/* $1/modular_stonehedge/icons/
cp -r strings/* $1/strings/

#remove .dm files from _maps

#this regrettably doesn't work with windows find
#find $1/_maps -name "*.dm" -type f -delete

#dlls on windows
if [ "$(uname -o)" = "Msys" ]; then
	cp ./*.dll $1/
fi
