@echo off
@set pathDW="%USERPROFILE%\Documents\Drink Water"
@set pathDWscript='%USERPROFILE%\Documents\Drink Water\DW.vbs'
@set pathCommander='%SystemRoot%\System32\wscript.exe'
mkdir %pathDW%
copy DW.vbs %pathDW%
copy DW_Exe.vbs %pathDW%
:: => replace DrinkWater_Reminder.exe,to avoid exe restriction.
schtasks /create /st 10:00:00 /du 10:00 /ri 60 /sc DAILY /mo 1 /tn "!!!!!Time to Drink Water!!!!!" /tr "%pathCommander% %pathDWscript%" /F
mshta vbscript:msgbox("Repeat every 1hr during 10am-8pm everyday",64,"Drink Water Reminder is Scheduled")(window.close)