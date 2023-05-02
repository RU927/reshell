#!/bin/sh
systemd-analyze critical-chain
systemd-analyze blame
systemd-analyze
# sudo systemctl disable blame systemd-networkd-wait-online.service && sudo systemctl mask blame systemd-networkd-wait-online.service
# sudo systemctl disable blame connman-wait-online.service && sudo systemctl mask blame connman-wait-online.service
