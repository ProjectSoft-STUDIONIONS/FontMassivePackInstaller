#include "version.iss"
#define AppName "FontMassive Pack"
#define GitReleace "https://github.com/ProjectSoft-STUDIONIONS/FontMassivePackInstaller/releases"
#define AppCopyright "Copyright © 2014 Алексей Коноплёв aka KLesha28"
#define AppPublisher "Алексей Коноплёв (KLesha28)"
#define AppUrl "https://fontmassive.com/"
#define AppEmail "support@fontmassive.com"
#define InstallBuilder "ProjectSoft"
#define InstallBuilderUrl "https://projectsoft-studionions.github.io/FontMassivePackInstaller/"
#define Source "source\FontMassive Pack"

[Setup]
AppId={{17215FF5-7CC0-4E50-8D24-FC5D6C1CFE67}
AppName={#AppName}
AppVersion={#AppVersion}
AppCopyright={#AppCopyright}
AppMutex={#AppName}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppUrl}
AppSupportURL={#AppUrl}
AppContact={#AppEmail}
AppComments=Сборка установки программы {#AppName}
AppReadmeFile={app}\FM3_Data\Readme_ru.txt
InfoBeforeFile=source\FontMassive Pack\FM3_data\History_ru.txt

VersionInfoVersion={#AppVersion}
VersionInfoCompany={#AppName}
VersionInfoDescription=Сборка установки программы {#AppName}
VersionInfoTextVersion={#AppVersion}
VersionInfoCopyright={#AppCopyright}
PrivilegesRequired=lowest
DefaultDirName={userpf}\FontMassivePack
UninstallDisplayIcon={userpf}\FontMassivePack\icon.ico
DefaultGroupName={#AppName} 

SolidCompression=true
Compression=lzma/ultra

OutputDir=installer
OutputBaseFilename=FontMassivePack

WizardImageFile=embed/wizard.bmp
WizardSmallImageFile=embed/logo.bmp

SetupIconFile=embed/icon.ico
UninstallDisplayName=Uninstal {#AppName}

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
ShowLanguageDialog=yes
LanguageDetectionMethod=locale

ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "ru"; MessagesFile: "compiler:Languages/Russian.isl" 
Name: "en"; MessagesFile: "compiler:Default.isl"

[CustomMessages]
en.FontMassive=Font Manager
ru.FontMassive=Менеджер шрифтов
en.FonTemp=Temporary installation of fonts
ru.FonTemp=Временная установка шрифтов
en.FontDetect=Recognizing fonts in an image
ru.FontDetect=Распознавание шрифтов на изображении
en.FontQuickView=Quick font preview
ru.FontQuickView=Быстрый просмотр шрифта
en.Circular=Straightening text around a circle
ru.Circular=Выпрямление текста по окружности
en.LinearText=Straightening text along a curve
ru.LinearText=Выпрямление текста по кривой
en.FonTempRun=Launch Font Manager
ru.FonTempRun=Запустить Временную установку шрифтов
en.FontMassiveRun=Launch Font Manager
ru.FontMassiveRun=Запустить Менеджер шрифтов
en.ReadmeRun=View README file
ru.ReadmeRun=Посмотреть файл README
en.HistoryRun=View Change History
ru.HistoryRun=Просмотреть историю изменений

[Dirs]
Name: {app}\FM3_Data
Name: {app}\FT_Data
Name: {app}\FD_Data  
Name: {app}\LT_data

[Files]
Source: embed\icon.ico; DestDir: {app}; DestName: icon.ico     
Source: {#Source}\FM3_data\History_ru.txt; DestDir: {app}; DestName: History_ru.txt
Source: {#Source}\FontCache_Restore.cmd; DestDir: {app}; DestName: FontCache_Restore.cmd
Source: {#Source}\FontCache_Stop.cmd; DestDir: {app}; DestName: FontCache_Stop.cmd

; Place all x64 files here
Source: {#Source}\FontMassive64.exe; DestDir: {app}; DestName: FontMassive.exe; Check: Is64BitInstallMode
Source: {#Source}\FonTemp64.exe; DestDir: {app}; DestName: FonTemp.exe; Check: Is64BitInstallMode
Source: {#Source}\FontDetect64.exe; DestDir: {app}; DestName: FontDetect.exe; Check: Is64BitInstallMode
Source: {#Source}\FontQuickView64.exe; DestDir: {app}; DestName: FontQuickView.exe; Check: Is64BitInstallMode

; Place all x86 files here, first one should be marked 'solidbreak'
Source: {#Source}\FontMassive.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak
Source: {#Source}\FonTemp.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak
Source: {#Source}\FontDetect.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak   
Source: {#Source}\FontQuickView.exe; DestDir: {app}; Check: not Is64BitInstallMode; Flags: solidbreak

; add files x86
Source: {#Source}\Circular.exe; DestDir: {app}; DestName: Circular.exe
Source: {#Source}\LinearText.exe; DestDir: {app}; DestName: LinearText.exe

; Place all common files here, first one should be marked 'solidbreak'                               
Source: {#Source}\FD_Data\*; DestDir: {app}\FD_Data; Flags: ignoreversion recursesubdirs createallsubdirs
Source: {#Source}\FM3_Data\*; DestDir: {app}\FM3_Data; Flags: ignoreversion recursesubdirs createallsubdirs  
Source: {#Source}\FQ_Data\*; DestDir: {app}\FQ_Data; Flags: ignoreversion recursesubdirs createallsubdirs
Source: {#Source}\FT_Data\*; DestDir: {app}\FT_Data; Flags: ignoreversion recursesubdirs createallsubdirs 

[Icons]
Name: {userprograms}\FontMassive Pack\{cm:FontMassive, FontMassive}; Filename: {app}\FontMassive.exe
Name: {userprograms}\FontMassive Pack\{cm:FonTemp, FonTemp}; Filename: {app}\FonTemp.exe
Name: {userprograms}\FontMassive Pack\{cm:FontDetect, FontDetect}; Filename: {app}\FontDetect.exe  
Name: {userprograms}\FontMassive Pack\{cm:FontQuickView, FontQuickView}; Filename: {app}\FontQuickView.exe
Name: {userprograms}\FontMassive Pack\{cm:Circular, Circular}; Filename: {app}\Circular.exe
Name: {userprograms}\FontMassive Pack\{cm:LinearText, LinearText}; Filename: {app}\LinearText.exe
Name: {group}\{cm:UninstallProgram, FontMassive Pack}; Filename: {uninstallexe}

[UninstallDelete]                     
Type: filesandordirs; Name: {app}\FD_Data
Type: filesandordirs; Name: {app}\FM3_Data    
Type: filesandordirs; Name: {app}\FQ_Data
Type: filesandordirs; Name: {app}\FT_Data  
Type: filesandordirs; Name: {app}\LT_Data 
Type: filesandordirs; Name: {app}

[Run]
Filename: {app}\FonTemp.EXE; Description: {cm:FonTempRun, Font Temp Run}; Flags: postinstall nowait skipifsilent unchecked
Filename: {app}\FontMassive.EXE; Description: {cm:FontMassiveRun, Font Massive Run}; Flags: postinstall nowait skipifsilent runminimized unchecked
Filename: {app}\FM3_Data\Readme_ru.txt; Description: {cm:ReadmeRun, Readme Run}; Flags: postinstall shellexec skipifsilent unchecked
Filename: {app}\FM3_data\History_ru.txt; Description: {cm:HistoryRun, History Run}; Flags: postinstall shellexec skipifsilent unchecked