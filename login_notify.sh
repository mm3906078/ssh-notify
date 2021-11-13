#!/usr/bin/env bash
# Content of /etc/ssh/login_notify.sh
TELEGRAM_TOKEN=""
CHAT_ID=""

if [ ${PAM_TYPE} = "open_session" ]; then
  MESSAGE="$PAM_USER@$PAM_RHOST: knock knock via $PAM_SERVICE"
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" -d chat_id="$CHAT_ID" -d text="$MESSAGE" > /dev/null 2>&1
fi
