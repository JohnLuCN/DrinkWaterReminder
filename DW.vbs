Set objSWbemServices = GetObject ("WinMgmts:Root\Cimv2")
Set colProcess = objSWbemServices.ExecQuery _
("Select * From Win32_Process WHERE Name = 'wscript.exe'")

For Each objProcess In colProcess
If InStr (objProcess.CommandLine, WScript.ScriptName) <> 0 Then
'WScript.Echo objProcess.Name, _
'objProcess.ProcessId, _
'objProcess.CommandLine
'''Coding Start
set ws=CreateObject("WScript.Shell")
pathDW=ws.ExpandEnvironmentStrings("%USERPROFILE%")&"\Documents\Drink Water"
ws.CurrentDirectory = pathDW
ws.run """DW_Exe.vbs"""	'replace DrinkWater_Reminder.exe,to avoid exe restriction.
'''Coding End
ELSE
set ws=CreateObject("WScript.Shell")
ws.run "cmd.exe /c taskkill /pid "& objProcess.ProcessId &" -t -f",0,true	'0->hide cmd window ture->wait for response, then resume....'replace DrinkWater_Reminder.exe,to avoid exe restriction.
End If
Next