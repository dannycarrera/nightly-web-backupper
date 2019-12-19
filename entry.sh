#!/bin/sh

# Add User
adduser -u $USER_ID -g $GROUP_ID theuser

# Update crontab.txt based on env var
if [ -z "$CRON_TIMER" ]
    then
        # is empty do nothing
        echo "CRON_TIMER is empty. Defaulting to 30 2 * * *"
    else
        # update crontab.txt
        echo "Setting cronjob timer to ${CRON_TIMER}"
        sed -i "1c\\${CRON_TIMER} /script.sh" crontab.txt
fi

# Add crontab for theuser
/usr/bin/crontab -u theuser /crontab.txt

# Start cron
/usr/sbin/crond -f -l 8