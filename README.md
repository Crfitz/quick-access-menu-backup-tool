# Quick Access Menu Backup Tool v1.2.0
A quick batch file that backs up and/or transfers the Quick Access Menu items in Windows

 08-NOV-2022
```
  08-NOV-2022

 Quick Access Menu - Backup and Transfer Tool v1.2.0
 Author: Cory Fitzsimmons; 2022 

 +--------------------------------------------------+

     Quick Access Menu - Backup and Transfer Tool   
                      Version %ver%                 
                   Fitzsimmons 2022                 
                                                    
 +--------------------------------------------------+

 Backup -
	Run this batch file on computer to be backed up; ORIGINATING computer if transferring Quick Access (QA)
		menu items.
	This will copy your current QA menu items to your user drive: Z:\Backups\quickaccess_backup
		If folders do not exist, they will be created.
	Creates a log of the backup; %log%.

 Restore -
	Run this batch file on the computer to be restored; DESTINATION computer if transferring Quick Access (QA)
		menu items.
	Makes a backup of your current QA menu items; saves locally to %USERPROFILE%
	Restore will copy your backedup QA menu items from your user drive (Z:\Backups\quickaccess_backup\*) to the destination
		computer.
		Copies items into: %QA_dest%
	Creates a log of the restore; %log%.
	After the restore process finishes, you will need to restart your explorer.exe or reboot your computer.
		
 Help - 
	Displays this help / info dialog.

 Exit - 
	Exits without any additional processing
  
```
