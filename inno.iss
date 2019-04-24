[Setup]
AppName=FontMassive Pack
AppVersion=3.0.21
AppCopyright=Copyright © 2014 Алексей Коноплев aka KLesha28
PrivilegesRequired=admin
DefaultDirName={pf}\FontMassive
DefaultGroupName=FontMassive Pack
UninstallDisplayIcon={uninstallexe}
Compression=lzma2
SolidCompression=yes
OutputDir=installer
OutputBaseFilename= FontMassivePack
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; On all other architectures it will install in "32-bit mode".
ArchitecturesInstallIn64BitMode=x64
; Note: We don't set ProcessorsAllowed because we want this
; installation to run on all architectures (including Itanium,
; since it's capable of running 32-bit code too).
WizardImageFile=embed/wizard.bmp 
WizardImageStretch=no 
WizardSmallImageFile=embed/logo.bmp
SetupIconFile=embed/icon.ico
ShowLanguageDialog=no
UninstallDisplayName=Удалить FontMassive Pack
VersionInfoVersion=3.0.21
VersionInfoCompany=FontMassive Pack
VersionInfoDescription=Сборка инсталяции для программы FontMassive Pack
VersionInfoTextVersion=3.0.21
VersionInfoCopyright=Copyright © 2014 Алексей Коноплев aka KLesha28
VersionInfoProductName=FontMassive Pack
VersionInfoProductVersion=3.0.21
VersionInfoProductTextVersion=3.0.21
AppMutex=FontMassive Pack
AppId={{39CA51DC-A5E5-4BAC-8339-9C6E378394E5}}
AppPublisher=Алексей Коноплев (KLesha28)
AppPublisherURL=https://fontmassive.com/
AppSupportURL=https://fontmassive.com/
AppContact=support@fontmassive.com
AppReadmeFile={app}\FM3_Data\Readme_ru.txt
; InfoAfterFile=app.rtf
DisableWelcomePage=no
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyMemo=yes
DisableReadyPage=yes
DisableStartupPrompt=yes
; DisableAppendDir=yes

[Languages]
Name: "rus"; MessagesFile: "lang\Russian.isl"

[Dirs]
Name: "{app}\FM3_Data"     
Name: "{app}\FT_Data"
Name: "{app}\FD_Data"
[Files]
; Place all x64 files here
Source: "source\FontMassive64.exe"; DestDir: "{app}"; DestName: "FontMassive.exe"; Check: Is64BitInstallMode
Source: "source\FonTemp64.exe"; DestDir: "{app}"; DestName: "FonTemp.exe"; Check: Is64BitInstallMode
Source: "source\FontDetect64.exe"; DestDir: "{app}"; DestName: "FontDetect.exe"; Check: Is64BitInstallMode
Source: "source\Circular64.exe"; DestDir: "{app}"; DestName: "Circular.exe"; Check: Is64BitInstallMode
Source: "source\LinearText64.exe"; DestDir: "{app}"; DestName: "LinearText.exe"; Check: Is64BitInstallMode
; Place all x86 files here, first one should be marked 'solidbreak'
Source: "source\FontMassive.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak
Source: "source\FonTemp.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak
Source: "source\FontDetect.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak
Source: "source\Circular.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak
Source: "source\LinearText.exe"; DestDir: "{app}"; Check: not Is64BitInstallMode; Flags: solidbreak
; Place all common files here, first one should be marked 'solidbreak'
Source: "source\FM3_Data\eng.lang"; DestDir: "{app}\FM3_Data"
Source: "source\FM3_Data\ukr.lang"; DestDir: "{app}\FM3_Data"
Source: "source\FM3_Data\zhs.lang"; DestDir: "{app}\FM3_Data"
Source: "source\FM3_Data\History_ru.txt"; DestDir: "{app}\FM3_Data"
Source: "source\FM3_Data\License_ru.txt"; DestDir: "{app}\FM3_Data"
Source: "source\FM3_Data\Readme_ru.txt"; DestDir: "{app}\FM3_Data"
Source: "source\FD_Data\License_ru.txt"; DestDir: "{app}\FD_Data"
Source: "source\FD_Data\Settings.ini"; DestDir: "{app}\FD_Data"
Source: "source\FT_Data\History_ru.txt"; DestDir: "{app}\FT_Data"
Source: "source\FT_Data\License_ru.txt"; DestDir: "{app}\FT_Data"
Source: "source\FT_Data\Readme_ru.txt"; DestDir: "{app}\FT_Data"

[Icons]
; Name: "{group}\FontMassive Pack\Менеджер шрифтов"; Filename: "{app}\FontMassive.exe"; Tasks: startmenu
; Name: "{group}\FontMassive Pack\Временная установка шрифтов"; Filename: "{app}\FonTemp.exe"; Tasks: startmenu  
; Name: "{group}\FontMassive Pack\Распознавание шрифтов на изображении"; Filename: "{app}\FontDetect.exe"; Tasks: startmenu  
; Name: "{group}\FontMassive Pack\Выпрямление текста по окружности"; Filename: "{app}\Circular.exe"; Tasks: startmenu 
; Name: "{group}\FontMassive Pack\Выпрямление текста по кривой"; Filename: "{app}\LinearText.exe"; Tasks: startmenu 

Name: "{userprograms}\FontMassive Pack\Менеджер шрифтов"; Filename: "{app}\FontMassive.exe"
Name: "{userprograms}\FontMassive Pack\Временная установка шрифтов"; Filename: "{app}\FonTemp.exe"  
Name: "{userprograms}\FontMassive Pack\Распознавание шрифтов на изображении"; Filename: "{app}\FontDetect.exe"  
Name: "{userprograms}\FontMassive Pack\Выпрямление текста по окружности"; Filename: "{app}\Circular.exe"
Name: "{userprograms}\FontMassive Pack\Выпрямление текста по кривой"; Filename: "{app}\LinearText.exe"

; Name: "{userstartmenu}\Менеджер шрифтов"; Filename: "{app}\FontMassive.exe"; Tasks: startmenu
; Name: "{userstartmenu}\Временная установка шрифтов"; Filename: "{app}\FonTemp.exe"; Tasks: startmenu
; Name: "{userstartmenu}\Распознавание шрифтов на изображении"; Filename: "{app}\FontDetect.exe"; Tasks: startmenu
; Name: "{userstartmenu}\Выпрямление текста по окружности"; Filename: "{app}\Circular.exe"; Tasks: startmenu
; Name: "{userstartmenu}\Выпрямление текста по кривой"; Filename: "{app}\LinearText.exe"; Tasks: startmenu

; Name: "{commondesktop}\Менеджер шрифтов"; Filename: "{app}\FontMassive.exe"; Tasks: desktopicon  
; Name: "{commondesktop}\Временная установка шрифтов"; Filename: "{app}\FonTemp.exe"; Tasks: desktopicon
; Name: "{commondesktop}\Распознавание шрифтов на изображении"; Filename: "{app}\FontDetect.exe"; Tasks: desktopicon
; Name: "{commondesktop}\Выпрямление текста по окружности"; Filename: "{app}\Circular.exe"; Tasks: desktopicon
; Name: "{commondesktop}\Выпрямление текста по кривой"; Filename: "{app}\LinearText.exe"; Tasks: desktopicon

Name: "{group}\Удалить FontMassive Pack"; Filename: "{uninstallexe}"


; [Tasks]
; Name: desktopicon; Description: "Создать ярлыки на рабочем столе"; GroupDescription: "Создать ярлыки:";
; Name: startmenu; Description: "Создать ярлыки в меню Программы"; GroupDescription: "Создать ярлыки:";

[UninstallDelete]
Type: files; Name: "{app}\FM3_Data\settings.ini"   
Type: files; Name: "{app}\FT_Data\settings.ini"
Type: filesandordirs; Name: "{app}\FM3_Data"     
Type: filesandordirs; Name: "{app}\FT_Data"
Type: filesandordirs; Name: "{app}\FD_Data"  
Type: filesandordirs; Name: "{app}"
; [Run]
; Filename: "{app}\FM3_Data\Readme_ru.txt"; Description: "Просмотреть файл README"; Flags: postinstall shellexec skipifsilent unchecked
; Filename: "{app}\FM3_Data\History_ru.txt"; Description: "Просмотреть Историю изменений"; Flags: postinstall shellexec skipifsilent unchecked
; Filename: "{app}\FontMassive.EXE"; Description: "Запустить FontMassive"; Flags: postinstall nowait skipifsilent runminimized runascurrentuser
; Filename: "{app}\FonTemp.EXE"; Description: "Запустить Менеджер коллекций шрифтов"; Flags: postinstall nowait skipifsilent runascurrentuser
[Registry]
Root: HKCU; SubKey: Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers; ValueType: string; ValueName: {app}\FontMassive.exe; ValueData: RUNASADMIN; Flags: uninsdeletevalue uninsdeletekeyifempty; MinVersion: 0,5.01; OnlyBelowVersion: 0,6.0    
Root: HKCU; SubKey: Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers; ValueType: string; ValueName: {app}\FonTemp.exe; ValueData: RUNASADMIN; Flags: uninsdeletevalue uninsdeletekeyifempty; MinVersion: 0,5.01; OnlyBelowVersion: 0,6.0
Root: HKCU; SubKey: Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers; ValueType: string; ValueName: {app}\FontMassive.exe; ValueData: WINXPSP3 RUNASADMIN; Flags: uninsdeletevalue uninsdeletekeyifempty; MinVersion: 0,6.0         
Root: HKCU; SubKey: Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers; ValueType: string; ValueName: {app}\FonTemp.exe; ValueData: WINXPSP3 RUNASADMIN; Flags: uninsdeletevalue uninsdeletekeyifempty; MinVersion: 0,6.0