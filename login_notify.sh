#!/usr/bin/env bash
# Content of /etc/ssh/ssh-notify/login_notify.sh
TELEGRAM_TOKEN=""
CHAT_ID=""

if [ ${PAM_TYPE} = "open_session" ]; then
  CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')
  DATE="$(date "+%d %b %Y %H:%M")"
	SRV_HOSTNAME=$(hostname -f)
	SRV_IP=$(hostname -I | awk '{print $1}')

	IPINFO="https://ipinfo.io/${CLIENT_IP}"
  
  MESSAGE="Connection from *${CLIENT_IP}* as ${USER} on *${SRV_HOSTNAME}* (*${SRV_IP}*)
	Date: ${DATE}
	More informations: [${IPINFO}](${IPINFO})"
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_TOKEN/sendMessage" -d chat_id="$CHAT_ID" -d text="$MESSAGE" > /dev/null 2>&1
fi
