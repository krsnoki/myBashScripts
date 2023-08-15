#!/bin/bash

echo "Enter the recipient's address: "
read TO_ADDRESS

echo "Enter the subject of the mail: "
read SUBJECT

echo "Write the body: "
read BODY

# Your email configuration

USESTARTTLS=YES
FROMLINEOVERRIDE=YES
MAILHUB=smtp.gmail.com:587
AUTHUSER='2022bit503@sggs.ac.in'
AUTHPASS='iobjhwemicpjluci' 

# Send the email
#echo "$BODY" | mail -s "$SUBJECT" -r "$AUTHUSER" "$TO_ADDRESS"
echo -e "Subject: $SUBJECT\n$BODY" | sendmail -F "Your Name" -t "$TO_ADDRESS"
