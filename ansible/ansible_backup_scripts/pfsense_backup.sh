#!/bin/bash

# Variables
REMOTE_HOST=""
REMOTE_USER=""
REMOTE_PASSWORD=""
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="/mnt/network_backup/Firewall_Configuration"
BACKUP_FILE="config_${TIMESTAMP}.xml"
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_FILE}"

# Backup Directory
mkdir -p $BACKUP_DIR

# Use sshpass get Configuration File
sshpass -p "$REMOTE_PASSWORD" ssh -o StrictHostKeyChecking=no "$REMOTE_USER"@"$REMOTE_HOST" 'cat /cf/conf/config.xml' > $BACKUP_PATH

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_PATH"
else
    echo "Backup failed"
fi
