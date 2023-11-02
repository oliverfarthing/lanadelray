#Build RDP Connection On Public Desktop
New-Item "C:\users\public\desktop\BIM Remote Desktop.rdp"
Set-Content "C:\users\public\desktop\BIM Remote Desktop.rdp" 'screen mode id:i:2
redirectclipboard:i:1
redirectprinters:i:1
redirectcomports:i:0
redirectsmartcards:i:1
devicestoredirect:s:*
drivestoredirect:s:*
redirectdrives:i:1
session bpp:i:32
prompt for credentials on client:i:1
server port:i:3389
allow font smoothing:i:1
promptcredentialonce:i:1
videoplaybackmode:i:1
audiocapturemode:i:1
gatewayusagemethod:i:2
gatewayprofileusagemethod:i:1
gatewaycredentialssource:i:0
full address:s:WINBIM-01.WINVIC.LOCAL
gatewayhostname:s:portal.winvic.co.uk
workspace id:s:Winrdsg-01.Winvic.local
use redirection server name:i:1
loadbalanceinfo:s:tsv://MS Terminal Services Plugin.1.Winvic_Construct
use multimon:i:1
screen mode id:i:2
desktopwidth:i:800
desktopheight:i:600
compression:i:1
keyboardhook:i:2
connection type:i:7
networkautodetect:i:1
bandwidthautodetect:i:1
displayconnectionbar:i:1
enableworkspacereconnect:i:0
disable wallpaper:i:0
allow desktop composition:i:0
disable full window drag:i:1
disable menu anims:i:1
disable themes:i:0
disable cursor setting:i:0
bitmapcachepersistenable:i:1
audiomode:i:0
redirectposdevices:i:0
autoreconnection enabled:i:1
authentication level:i:0
prompt for credentials:i:0
negotiate security layer:i:1
remoteapplicationmode:i:0
alternate shell:s:
shell working directory:s:
gatewaybrokeringtype:i:0
rdgiskdcproxy:i:0
kdcproxyname:s:'
