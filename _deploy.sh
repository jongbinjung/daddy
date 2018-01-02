#!/usr/bin/env bash

# Created: 2018-01-02
# Author: jongbin
# Description: Update themes and deploy hugo to public

git submodule init
git submodule update
hugo

