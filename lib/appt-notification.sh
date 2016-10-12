#!/bin/sh

TIME="$1"
MSG="$2"

### Create a desktop notification
notify-send -t 0 "$MSG" "Appointment in $TIME minutes"

### Create a spoken reminder of the appointment
###
###     Note that this depends on having espeak, mbrola, and an mbrola voice
###     database installed. On Ubuntu/Mint the necessary packages are
###
###         espeak mbrola mbrola-en1
###
###     Future updates should involved using espeak (and mbrola?) settings to
###     improve the voice output.

# First, use espeak to process phonemes
espeak -s 130 "Holy shit! You have an appointment in $TIME minutes! $MSG" --pho > /tmp/alarm_phonemes
# Then have mbrola create an audio file speaking those phonemes. (This results
# in higher quality audio than just having espeak read the message directly.)
mbrola /usr/share/mbrola/en1/en1 /tmp/alarm_phonemes /tmp/alarm_message.wav
# Play the audio file
play /tmp/alarm_message.wav
