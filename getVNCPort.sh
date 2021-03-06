#! /bin/csh

set vncPortList = `ps ax | grep $USER | grep /usr/bin/Xvnc | gawk '{print $(6)}'`
set len = ${#vncPortList} 
if ( $len > 0 ) then
  echo "$USER is using VNC Port $vncPortList. OK"
#  echo $vncPortList
  set vncPort = ${vncPortList[1]}
  setenv DISPLAY $vncPort
else
  echo "No VNCServer is started for $USER. Start vncserver!"
  vncserver
  sleep 5
  set vncPortList = `ps ax | grep $USER | grep /usr/bin/Xvnc | gawk '{print $(6)}'`
  set len = ${#vncPortList}
  if ( $len > 0 ) then
    echo "$USER is using VNC Port $vncPortList. OK"
    set vncPort = ${vncPortList[1]}
    setenv DISPLAY $vncPort
  else
    echo "Can NOT Start vncserver!"     
  endif

endif

