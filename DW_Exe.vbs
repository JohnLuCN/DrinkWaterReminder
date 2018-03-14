
Set shell = CreateObject("Shell.Application")
Set wshShell = WScript.CreateObject( "WScript.Shell" )
userName = wshShell.ExpandEnvironmentStrings( "%USERNAME%" )
dim result

shell.MinimizeAll
result=msgbox("Dear " & userName & vbcrlf & "                                                                                           "& vbcrlf & "Do You Wanna Drink Some Water Right Now?", 32+4096+4, "DRINK WATER REMINDER")

do while (result<>6)

shell.UndoMinimizeAll
Wscript.Sleep(10*60*1000)	'Repeat Every 10Mins
result=msgbox("Dear " & userName & vbcrlf & "                                                                                           "& vbcrlf & "Do You Wanna Drink Some Water Right Now?", 32+4096+4, "DRINK WATER REMINDER")

loop

wshShell.Run "rundll32.exe user32.dll, LockWorkStation"