::batch file; .bat

@echo off

echo.
set ver=1.1
cls

:MENU
echo. 
echo. +--------------------------------------------------+
echo.
echo.            COMPANY XXXXXX, xCITYx CAMPUS            
echo.                                                    
echo.     Quick Access Menu - Backup and Transfer Tool   
echo.                      Version %ver%                 
echo.                   Fitzsimmons 2022                 
echo.                                                    
echo. +--------------------------------------------------+
echo.

::Setting variables
set QA_dest=%AppData%\Microsoft\Windows\Recent\AutomaticDestinations
set QA_Backup_Loc=U:\Backups\quickaccess_backup
set log=%Userprofile%\Backup_Logs\quick_access_backup_log.txt


echo. TASK SELECTION: 
echo. ......................................................................
echo.
echo. 1 - BACKUP Quick Access Menu from COMPUTER to VA USER DRIVE (U:)
echo. 2 - RESTORE Quick Access Menu from VA USER DRIVE (U:) to COMPUTER
echo. 3 - Help / More info
echo. 4 - EXIT
echo.
SET /P M=Type 1, 2, 3, or 4; then press ENTER: 
echo.
IF %M%==1 GOTO BACKUP
IF %M%==2 GOTO RESTORE
IF %M%==3 GOTO HELP
IF %M%==4 GOTO EOF


:BACKUP
echo.
echo. *** BACKING UP QA MENU ITEMS ***
echo.
mkdir %Userprofile%\Backup_Logs
mkdir %QA_Backup_Loc%

echo. Log Location: %log% >> %log%
Robocopy %QA_dest% %QA_Backup_Loc% /MIR /V /TEE /TS /R:1000 >> %log%
echo.
echo. Backup Successful!
echo. Location: %QA_Backup_Loc%
echo.
start %log%
GOTO MENU

::Robocopy %Userprofile%\folder  Z:\folder\ /MIR /XA:SH /V /TEE /TS /R:1000 > %log%
:: /MIR :: MIRror a directory tree (equivalent to /E plus /PURGE).
:: /V verbose
:: /TS :: include source file Time Stamps in the output.
:: /TEE :: output to console window, as well as the log file.
:: /R:0 :: number of Retries on failed copies: default 1 million.


:RESTORE
echo.
echo. *** RESTORING QA MENU ITEMS ***
echo.

mkdir %Userprofile%\Backup_Logs
::Backup of current QA items; place in new folder
Robocopy %QA_Backup_Loc% %Userprofile%\Backups\quickaccess_backup /MIR /V /TEE /TS
cd %QA_Backup_Loc%
echo. Log Location: %log% >> %log%
Robocopy %QA_Backup_Loc% %QA_dest% /MIR /V /TEE /TS >> %log%
echo. Restore Successful!
echo. Location: %QA_Backup_Loc%
echo. * * * You may need to restart explorer.exe or your PC * * *
echo.
start %log%
GOTO MENU


:HELP
cls
echo.
echo. +--------------------------------------------------+
echo.
echo.            COMPANY XXXXXX, xCITYx CAMPUS            
echo.                                                    
echo.     Quick Access Menu - Backup and Transfer Tool   
echo.                      Version %ver%                 
echo.                   Fitzsimmons 2022                 
echo.                                                    
echo. +--------------------------------------------------+
echo.
echo. *** HELP / MORE INFO ***
echo.
echo. Backup -
echo.	Run this batch file on computer to be backed up; ORIGINATING computer if transferring Quick Access (QA)
echo.	  menu items.
echo.	This will copy your current QA menu items to your user drive: U:\Backups\quickaccess_backup
echo.	  If folders do not exist, they will be created.
echo.	Creates a log of the backup; %log%.
echo.
echo. Restore -
echo.	Run this batch file on the computer to be restored; DESTINATION computer if transferring Quick Access (QA)
echo.		menu items.
echo.	Makes a backup of your current QA menu items
echo.	This will copy your QA menu items from your user drive (U:\Backups\quickaccess_backup) to the destination
echo.		computer.
echo.		Copies items into: %QA_dest%
echo.	Creates a log of the restore; %log%.
echo.	After the restore process finishes, you will need to restart your explorer.exe or reboot your computer.
echo.		
echo. Help - 
echo.	Displays this help / info dialog.
echo.
echo. Exit - 
echo.	Exits without any additional processing
echo.
echo.
GOTO MENU



