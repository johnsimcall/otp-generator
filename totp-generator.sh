# Instructions:
#
# 1 - Create a 20-byte (40-character) HMAC-SHA1 key by executing `openssl rand -hex 20`
# 2 - Upload the key to token.redhat.com (while connected to the VPN)
# 3 - Store the key in the KEY variable below
# 4 - (Optional) store your pin in the PIN variable below

#!/bin/bash 

# Setup variables
KEY=1234567890abcdef1234567890abcdef12345678
PIN=y0uRp1n

# Confirm requirements
type -p oathtool >/dev/null 2>&1 || ( echo "Can't find oathtool!" ; exit 1 )
#type -p xsel      >/dev/null 2>&1 || ( echo "Can't find xsel!"     ; exit 1 )  # for Linux
type -p pbcopy      >/dev/null 2>&1 || ( echo "Can't find pbcopy!"     ; exit 1 )  # for macOS

# Generate token
TOKEN=$(oathtool --totp=sha1 ${KEY})

# Copy token into Linux clipboard(s)
#echo ${PIN}${TOKEN} | xsel -ip
#echo ${PIN}${TOKEN} | xsel -ib

# Copy token into macOS clipboard
echo ${PIN}${TOKEN} | pbcopy
