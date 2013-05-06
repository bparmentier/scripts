#!/bin/bash

tts `weather`
mpc -q -h 192.168.1.36 play
