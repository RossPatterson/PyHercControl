py herccontrol "ipl 6a1" -w ""
if %errorlevel% NEQ 0 goto:eof 
py herccontrol "" -w "USER DSC LOGOFF AS AUTOLOG1"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/enable all" -w "COMMAND COMPLETE"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/cp disc" -w "^VM Community Edition"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/logon cmsuser cmsuser" -w "^VM Community Edition"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/" -w "^Ready"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/listf * * a" -w "^Ready"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/logoff" -w "^VM Community Edition"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/logon operator operator" -w "RECONNECTED AT"
if %errorlevel% NEQ 0 goto:eof
py herccontrol "/shutdown" -w "^HHCCP011I"
