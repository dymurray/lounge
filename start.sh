#!/bin/bash -e

echo
echo 'Starting lounge'
echo '----------------'
echo $(id -G)
echo '----------------'
echo $(ls -la /opt/lounge)
echo $(ls -la /etc/passwd)
/usr/bin/lounge --home /opt/lounge start
echo
