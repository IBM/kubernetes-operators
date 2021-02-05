#!/bin/sh

echo "Uninstalling operator-sdk ..."
sudo rm /usr/local/bin/operator-sdk
sudo rm /usr/local/bin/ansible-operator
sudo rm /usr/local/bin/helm-operator
echo "Uninstall complete."