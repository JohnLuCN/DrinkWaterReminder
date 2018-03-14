@echo off
@set pathDW="%USERPROFILE%\Documents\Drink Water"
taskkill /f /im wscript.exe
:: => replace DrinkWater_Reminder.exe,to avoid exe restriction.
schtasks /delete /tn "!!!!!Time to Drink Water!!!!!" /F
rd/s/q %pathDW%
mshta vbscript:msgbox("Drink Water Scheduler has been Successfully Removed",64,"Drink Water Reminder")(window.close)