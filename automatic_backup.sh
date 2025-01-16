#!/bin/bash

# Path to pfSense backup script
BACKUP_SCRIPT="/home/rjones/Scripts/pfsense_backup.sh"

# Path to Ansible playbook command
ANSIBLE_PLAYBOOK_CMD="ansible-playbook -i /home/rjones/ansible/hosts /home/rjones/ansible/backup.yaml -e "ansible_host_key_checking=False""

# Run the pfSense backup script
echo "Starting pfSense backup..."
$BACKUP_SCRIPT
if [ $? -eq 0 ]; then
    echo "pfSense backup completed successfully."
else
    echo "pfSense backup failed!"
    exit 1
fi

# Run the Ansible playbook
echo "Starting Ansible playbook..."
$ANSIBLE_PLAYBOOK_CMD
if [ $? -eq 0 ]; then
    echo "Ansible playbook executed successfully."
else
    echo "Ansible playbook execution failed!"
    exit 1
fi