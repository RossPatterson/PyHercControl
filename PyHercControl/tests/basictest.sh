#!/bin/bash
set -e
set -x
./herccontrol "ipl 6a1" -w "" --debug
./herccontrol "" -w "USER DSC LOGOFF AS AUTOLOG1"
./herccontrol "/enable all" -w "COMMAND COMPLETE"
./herccontrol "/cp disc" -w "^VM/370 Online"
./herccontrol "/logon cmsuser cmsuser" -w "^VM Community Edition"
./herccontrol "/" -w "^Ready"
./herccontrol "/listf * * a" -w "^Ready"
./herccontrol "/logoff" -w "^VM/370 Online"
./herccontrol "/logon operator operator" -w "RECONNECTED AT"
./herccontrol "/shutdown" -w "^HHCCP011I"
