Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 3 /f
Reg Add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /t REG_BINARY /d "90 32 07 80 10 00 00 00" /f

#Open File Explorer to: This PC
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

#Show hidden files, folders, and drives
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f

#Hide protected operating system files (Recommended)
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 0 /f
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideIcons" /t REG_DWORD /d 0 /f

#Hide extensions for known file types
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

#Navigation pane: Expand to open folder
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d 1 /f

#Navigation pane: Show all folders
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t REG_DWORD /d 1 /f

#Animate windows when minimizing and maximizing
Reg Add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /f

#Animations in the taskbar
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f

#Enable Peek
Reg Add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d 0 /f

#Save taskbar thumbnail previews
Reg Add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d 0 /f

#Show translucent selection rectangle
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /t REG_DWORD /d 0 /f

#Show thumbnails instead of icons
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d 0 /f

#Show window contents while dragging
Reg Add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /d 0 /f

#Smooth edges of screen fonts
Reg Add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /t REG_SZ /d 2 /f

#Use drop shadows for icon labels on the desktop
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d 1 /f

#Enable Light & Dark mode user access
Reg Delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /f
Reg Delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /f