#!/bin/sh

image="${REGISTRY-}${REGISTRY+/}$1"
echo -e "image \e[34m${image}\e[39m"

klar "${image}"
