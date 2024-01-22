#!/bin/bash

#!/bin/bash

# Zmienne
TOKEN=""
CHAT_ID="-4116581447"
MESSAGE=$1

function SendMessage() {
    response=$(curl -s -X POST \
        https://api.telegram.org/bot$TOKEN/sendMessage \
        -d parse_mode=markdown \
        -d chat_id=$CHAT_ID \
        -d text="$1")
    message_id=$(echo $response | jq -r '.result.message_id')
    echo $message_id
}

function EdidMessage() {
    curl -s -X POST \
        https://api.telegram.org/bot$TOKEN/editMessageText \
        -d parse_mode=markdown \
        -d chat_id=$CHAT_ID \
        -d message_id="$1" \
        -d text="$2" \
        > /dev/null
}

STATUS="Repo syncing"
 MESSAGE="
 
 ---------------------------
*NewTask : [derp][raphael]*
Time: $(date '+%d-%m-%Y %H:%M')
---------------------------
*Status:
$STATUS*
---------------------------


"
STATUS1="ROM Building..."
 MESSAGE1="
 
 ---------------------------
*NewTask : [derp][raphael]*
Time: $(date '+%d-%m-%Y %H:%M')
**Updated**
---------------------------
*Status:
$STATUS1*
---------------------------


"

id=$(SendMessage "$MESSAGE")
sleep 5
EdidMessage $id "$MESSAGE1"

