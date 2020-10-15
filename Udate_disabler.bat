::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAlTi
::ZQ05rAF9IAHYFVzEqQIIfDcEYlDPKXu+B6EZiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDDGSOGquA/UY4fv67eaCsC0=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWGHQ2BIee3s=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmW4UxwKQgUTQCPNWXa
::Zh4grVQjdCyDJGyX8VAjFCRsGCjSEjiFOpEZ++Pv4Pq7l10ZVfY6NYvSybWMLOUBpED8cPY=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
mode con: cols:60 lines:10
color 06


for /f "tokens=3 delims=: " %%i in ('sc qc wuauserv ^| findstr "START_TYPE"') do (
	
	set startup_type=%%i
)
for /f "tokens=3 delims=: " %%y in ('sc query wuauserv ^| findstr "STATE"') do (
	
	set service_status=%%y
	
)

cls
echo ====================_Auto update Disabler_==================
echo " /$$   /$$       /$$                         /$$          "
echo "| $$  / $$      | $$                        | $$          "
echo "|  $$/ $$/     /$$$$$$    /$$$$$$   /$$$$$$ | $$  /$$$$$$$"
echo " \  $$$$/     |_  $$_/   /$$__  $$ /$$__  $$| $$ /$$_____/"
echo "  >$$  $$       | $$    | $$  \ $$| $$  \ $$| $$|  $$$$$$ "
echo " /$$/\  $$      | $$ /$$| $$  | $$| $$  | $$| $$ \____  $$"
echo "| $$  \ $$ /$$  |  $$$$/|  $$$$$$/|  $$$$$$/| $$ /$$$$$$$/"
echo "|__/  |__/|__/   \___/   \______/  \______/ |__/|_______/ "
echo "==================_Pleas wait. . . _======================"

if /I "%startup_type%" == "DISABLED" (
			if /I "%service_status%" == "RUNNING" (
				sc stop wuauserv
				if %ERRORLEVEL% NEQ 0 goto err
			) else exit
		) else (
				set "startup_type="
				goto update1
			)

:update1

sc stop wuauserv
net stop wuauserv
sc config bits start= disabled
sc config dosvc start= disabled	
sc config wuauserv start= disabled

if %ERRORLEVEL% NEQ 0 (
		
		mode con: cols=48 lines=20
		color 04
		
		cls
		echo  =============================================
		echo "  ______   _____    _____     ____    _____  "
        echo " |  ____| |  __ \  |  __ \   / __ \  |  __ \ "
        echo " | |__    | |__) | | |__) | | |  | | | |__) |"
        echo " |  __|   |  _  /  |  _  /  | |  | | |  _  / "
        echo " | |____  | | \ \  | | \ \  | |__| | | | \ \ "
        echo " |______| |_|  \_\ |_|  \_\  \____/  |_|  \_\"
        echo "                                             "
		echo "                Plaes check:                 "
		echo "                                             "
		echo "           Run as Administrator?             "
		echo "                                             "
		echo           ERROR CODE IS : %ERRORLEVEL%
		echo "============================================="
	
		set /p pause=Press a key...
		exit
		
	) else (

		mode con: cols=100 lines=12
		color 0a
		
        cls
		echo  ==========================================================================================
		echo "   _____   _    _    _____    _____   ______    _____    _____   ______   _    _   _      "
        echo "  / ____| | |  | |  / ____|  / ____| |  ____|  / ____|  / ____| |  ____| | |  | | | |     "
        echo " | (___   | |  | | | |      | |      | |__    | (___   | (___   | |__    | |  | | | |     "
        echo "  \___ \  | |  | | | |      | |      |  __|    \___ \   \___ \  |  __|   | |  | | | |     "
        echo "  ____) | | |__| | | |____  | |____  | |____   ____) |  ____) | | |      | |__| | | |____ "
        echo " |_____/   \____/   \_____|  \_____| |______| |_____/  |_____/  |_|       \____/  |______|"
        echo "                                                                                          "
        echo "=========================================================================================="
		echo "                                    UPDATE IS DISABLED                                    " 
		echo "=========================================================================================="
		::set /p pause=Press a key...
		timeout /T 2 /NOBREAK > NUL
		 exit
		)

:err

		mode con: cols=48 lines=20
		color 04
		
		cls
		echo  =============================================
		echo "  ______   _____    _____     ____    _____  "
        echo " |  ____| |  __ \  |  __ \   / __ \  |  __ \ "
        echo " | |__    | |__) | | |__) | | |  | | | |__) |"
        echo " |  __|   |  _  /  |  _  /  | |  | | |  _  / "
        echo " | |____  | | \ \  | | \ \  | |__| | | | \ \ "
        echo " |______| |_|  \_\ |_|  \_\  \____/  |_|  \_\"
        echo "                                             "
		echo "                Plaes check:                 "
		echo "                                             "
		echo "           Run as Administrator?             "
		echo "                                             "
		echo           ERROR CODE IS : %ERRORLEVEL%
		echo "============================================="
	
		set /p pause=Press a key...
		exit













