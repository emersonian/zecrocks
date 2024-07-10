#!/bin/bash
set -e

# Determine the server line to uncomment based on FLY_REGION
SERVER_LINE="server region_${FLY_REGION}"

echo "Configuring HAProxy to use server: ${SERVER_LINE} for region: ${FLY_REGION}"

# Uncomment the specific server line in the configuration based on the region
sed "s/#\s*\(${SERVER_LINE}.*\)/\1/" /usr/local/etc/haproxy/haproxy.cfg > ~/haproxy.cfg

echo "This is the final config:"
cat ~/haproxy.cfg

# Now, start HAProxy with the modified configuration
exec haproxy -f ~/haproxy.cfg

