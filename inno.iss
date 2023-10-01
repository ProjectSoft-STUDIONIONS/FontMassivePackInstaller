#define AppName "FontMassive Pack"
#define AppVersion "3.0.25"
#define GitReleace "https://github.com/ProjectSoft-STUDIONIONS/FontMassivePackInstaller/releases"
#define AppCopyright "Copyright © 2014 Алексей Коноплев aka KLesha28"
#define AppPublisher "Алексей Коноплев (KLesha28)"
#define AppUrl "https://fontmassive.com/"
#define AppEmail "support@fontmassive.com"
#define InstallBuilder "ProjectSoft"
#define InstallBuilderUrl "https://demiart.ru/forum/journal.php?user=1393929&comm=443843"

[Setup]
AppId={{17215FF5-7CC0-4E50-8D24-FC5D6C1CFE67}
AppName={#AppName}
AppVersion={#AppVersion}
AppCopyright={#AppCopyright}
AppMutex=F{#AppName}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
AppContact={#AppEmail}
AppComments=Сборка инсталяции для программы {#AppName}
AppReadmeFile={app}\FM3_Data\Readme_ru.txt
InfoBeforeFile=app.rtf

VersionInfoVersion={#AppVersion}
VersionInfoCompany={#AppName}
VersionInfoDescription=Сборка инсталяции для программы {#AppName}
VersionInfoTextVersion={#AppVersion}
VersionInfoCopyright={#AppCopyright}
PrivilegesRequired=lowest
DefaultDirName={userappdata}\FontMassive
UninstallDisplayIcon={app}\icon.ico
DefaultGroupName={#AppName} 

SolidCompression=true
Compression=lzma/ultra

OutputDir=installer
OutputBaseFilename=FontMassivePack

WizardImageFile=embed/wizard.bmp
WizardSmallImageFile=embed/logo.bmp

SetupIconFile=embed/icon.ico
UninstallDisplayName=Удалить {#AppName}

WindowVisible=false
DisableWelcomePage=False
DisableReadyPage=true
DisableReadyMemo=true
DisableFinishedPage=false
FlatComponentsList=false
AlwaysShowComponentsList=false
ShowComponentSizes=false
WindowShowCaption=false
WindowResizable=false
UsePreviousAppDir=False
UsePreviousGroup=False
VersionInfoProductName={#AppName}
VersionInfoProductVersion={#AppVersion}
VersionInfoProductTextVersion={#AppName} v{#AppVersion}
BackSolid=true
WindowStartMaximized=false
InternalCompressLevel=ultra
DisableProgramGroupPage=yes
AppUpdatesURL={#GitReleace}
DisableDirPage=yes
ShowLanguageDialog=no

ArchitecturesInstallIn64BitMode=x64


[Languages]
Name: rus; MessagesFile: lang/Russian.isl

[Dirs]
Name: {app}\FM3_Data
Name: {app}\FT_Data
Name: {app}\FD_Data  
Name: {app}\LT_data

[Files]
Source: embed\splash.bmp; DestDir: {tmp}; Flags: deleteafterinstall noencryption dontcopy
Source: embed\icon.ico; DestDir: {app}; DestName: icon.ico
Source: source\FontMassive Pack\FontCache_Restore.cmd; DestDir: {app}; DestName: FontCache_Restore.cmd
Source: source\FontMassive Pack\FontCache_Stop.cmd; DestDir: {app}; DestName: FontCache_Stop.cmd
; Place all x64 files here
Source: source\FontMassive Pack\FontMassive64.exe; DestDir: {app}; DestName: FontMassive.exe; Check: Is64BitInstallMode
Source: source\FontMassive Pack\FonTemp64.exe; DestDir: {app}; DestName: FonTemp.exe; Check: Is64BitInstallMode
Source: source\FontMassive Pack\FontDetect64.exe; DestDir: {app}; DestName: FontDetect.exe; Check: Is64BitInstallMode
Source: source\FontMassive Pack\Circular64.exe; DestDir: {app}; DestName: Circular.exe; Check: Is64BitInstallMode
Source: source\FontMassive Pack\LinearText64.exe; DestDir: {app}; DestName: LinearText.exe; Check: Is64BitInstallMode
; Place all x86 files here, first one should be marked 'solidbreak'
Source: source\FontMassive Pack\FontMassive.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak
Source: source\FontMassive Pack\FonTemp.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak
Source: source\FontMassive Pack\FontDetect.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak
Source: source\FontMassive Pack\Circular.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak
Source: source\FontMassive Pack\LinearText.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak
; Place all common files here, first one should be marked 'solidbreak'
Source: source\FontMassive Pack\FM3_Data\eng.lang; DestDir: {app}\FM3_Data
Source: source\FontMassive Pack\FM3_Data\ukr.lang; DestDir: {app}\FM3_Data
Source: source\FontMassive Pack\FM3_Data\zhs.lang; DestDir: {app}\FM3_Data
Source: source\FontMassive Pack\FM3_Data\History_ru.txt; DestDir: {app}\FM3_Data
Source: source\FontMassive Pack\FM3_Data\License_ru.txt; DestDir: {app}\FM3_Data
Source: source\FontMassive Pack\FD_Data\License_ru.txt; DestDir: {app}\FD_Data
Source: source\FontMassive Pack\FT_Data\History_ru.txt; DestDir: {app}\FT_Data
Source: source\FontMassive Pack\FT_Data\License_ru.txt; DestDir: {app}\FT_Data
Source: source\FontMassive Pack\FT_Data\Readme_ru.txt; DestDir: {app}\FT_Data
Source: source\FontMassive Pack\FT_Data\eng.lang; DestDir: {app}\FT_Data

[Icons]
Name: {userprograms}\FontMassive Pack\Менеджер шрифтов; Filename: {app}\FontMassive.exe; Tasks: startmenu
Name: {userprograms}\FontMassive Pack\Временная установка шрифтов; Filename: {app}\FonTemp.exe; Tasks: startmenu
Name: {userprograms}\FontMassive Pack\Распознавание шрифтов на изображении; Filename: {app}\FontDetect.exe; Tasks: startmenu
Name: {userprograms}\FontMassive Pack\Выпрямление текста по окружности; Filename: {app}\Circular.exe; Tasks: startmenu
Name: {userprograms}\FontMassive Pack\Выпрямление текста по кривой; Filename: {app}\LinearText.exe; Tasks: startmenu

Name: {group}\{cm:UninstallProgram, FontMassive Pack}; Filename: {uninstallexe}; Tasks: startmenu

[Tasks]
Name: startmenu; Description: Создать ярлыки в меню Программы; GroupDescription: Создать ярлыки:

[UninstallDelete]
Type: files; Name: {app}\FM3_Data\settings.ini
Type: files; Name: {app}\FT_Data\settings.ini    
Type: files; Name: {app}\LT_data\settings.ini 
Type: filesandordirs; Name: {app}\FM3_Data
Type: filesandordirs; Name: {app}\FT_Data
Type: filesandordirs; Name: {app}\FD_Data   
Type: filesandordirs; Name: {app}\LT_data
Type: filesandordirs; Name: {app}

[Run]
Filename: {app}\FonTemp.EXE; Description: Запустить Менеджер коллекций шрифтов; Flags: postinstall nowait skipifsilent unchecked
Filename: {app}\FontMassive.EXE; Description: Запустить FontMassive; Flags: postinstall nowait skipifsilent runminimized unchecked
Filename: {app}\FM3_Data\Readme_ru.txt; Description: Просмотреть файл README; Flags: postinstall shellexec skipifsilent unchecked
Filename: {app}\FM3_Data\History_ru.txt; Description: Просмотреть Историю изменений; Flags: postinstall shellexec skipifsilent unchecked