#!/bin/sh

DATA_DIR="/var/lib/dropbox/live"
DROPBOX_WEBSITE_DIR=" /var/lib/dropbox/backups"

DATE=$(date +%Y-%m-%d"_"%H-%M-%S)

NUM_BACKUPS=$(ls -1 ${DROPBOX_WEBSITE_DIR} | wc -l)

if [ $NUM_BACKUPS -ge 3 ]; then
    echo $NUM_BACKUPS backups found. Deleting all except the newest 2
    (cd $DROPBOX_WEBSITE_DIR && ls -1tr | head -n -2 | xargs rm -f --)
fi

BACKUP_PATH="${DROPBOX_WEBSITE_DIR}/${WEBSITE_NAME}_backup_${DATE}.tar.gz"

echo Saving Backup: $BACKUP_PATH

tar -zcf $BACKUP_PATH -C $DATA_DIR .