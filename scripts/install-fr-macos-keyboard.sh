#!/bin/bash
# Configuring MacOs FR Keyboard
  
echo 'Configuring Mac Keyboard..'
echo -n 'IyBLRVlCT0FSRCBDT05GSUdVUkFUSU9OIEZJTEUKCiMgQ29uc3VsdCB0aGUga2V5Ym9hcmQoNSkgbWFudWFsIHBhZ2UuCgpYS0JNT0RFTD0icGMxMDUiClhLQkxBWU9VVD0iZnIiClhLQlZBUklBTlQ9Im1hYyIKWEtCT1BUSU9OUz0ibHYzOmxhbHRfc3dpdGNoLGNvbXBvc2U6bHdpbiIKCkJBQ0tTUEFDRT0iZ3Vlc3MiCg==' | base64 -d > /etc/default/keyboard 
mkdir -p /home/kali/.config/autostart/
echo -n 'W0Rlc2t0b3AgRW50cnldCkVuY29kaW5nPVVURi04ClZlcnNpb249MC45LjQKVHlwZT1BcHBsaWNhdGlvbgpOYW1lPWZyCkNvbW1lbnQ9bWFjCkV4ZWM9c2V0eGtibWFwIC1tb2RlbCBwYzEwNSAtbGF5b3V0IGZyIC12YXJpYW50IG1hYyAtb3B0aW9uIGx2MzpsYWx0X3N3aXRjaCxjb21wb3NlOmx3aW4KT25seVNob3dJbj1YRkNFOwpSdW5Ib29rPTAKU3RhcnR1cE5vdGlmeT1mYWxzZQpUZXJtaW5hbD1mYWxzZQpIaWRkZW49ZmFsc2U=' | base64 -d > /home/kali/.config/autostart/fr.desktop && chmod +x /home/kali/.config/autostart/fr.desktop
