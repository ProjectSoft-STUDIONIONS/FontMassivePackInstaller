#include "version.iss"
#define AppName "FontMassive Pack"
#define GitReleace "https://github.com/ProjectSoft-STUDIONIONS/FontMassivePackInstaller/releases"
#define AppCopyright "Copyright © 2014 Alexey Konoplev aka KLesha28"
#define AppPublisher "Alexey Konoplev (KLesha28)"
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
AppComments=Building an installation for the program {#AppName}
AppReadmeFile={app}\FM3_Data\Readme_ru.txt
InfoBeforeFile=source\History.rtf

VersionInfoVersion={#AppVersion}
VersionInfoCompany={#AppName}
VersionInfoDescription=Building an installation for the program {#AppName}
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

[LangOptions]
LanguageName=<0420><0443><0441><0441><043A><0438><0439>
LanguageID=$0419
LanguageCodePage=1251

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Dirs]
Name: {app}\FM3_Data
Name: {app}\FT_Data
Name: {app}\FD_Data  
Name: {app}\LT_data

[Files]
Source: embed\splash.bmp; DestDir: {tmp}; Flags: deleteafterinstall noencryption dontcopy
Source: embed\icon.ico; DestDir: {app}; DestName: icon.ico     
Source: source\History.rtf; DestDir: {app}; DestName: History.rtf
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
Name: {userprograms}\FontMassive Pack\Font Manager; Filename: {app}\FontMassive.exe
Name: {userprograms}\FontMassive Pack\Temporary installation of fonts; Filename: {app}\FonTemp.exe
Name: {userprograms}\FontMassive Pack\Image font recognition; Filename: {app}\FontDetect.exe
Name: {userprograms}\FontMassive Pack\Straighten text around a circle; Filename: {app}\Circular.exe
Name: {userprograms}\FontMassive Pack\Straighten text along a curve; Filename: {app}\LinearText.exe
Name: {userprograms}\FontMassive Pack\Font Quick View; Filename: {app}\FontQuickView.exe
Name: {group}\{cm:UninstallProgram, FontMassive Pack}; Filename: {uninstallexe}

[UninstallDelete]                     
Type: filesandordirs; Name: {app}\FD_Data
Type: filesandordirs; Name: {app}\FM3_Data    
Type: filesandordirs; Name: {app}\FQ_Data
Type: filesandordirs; Name: {app}\FT_Data  
Type: filesandordirs; Name: {app}\LT_Data 
Type: filesandordirs; Name: {app}

[Run]
Filename: {app}\FonTemp.EXE; Description: Launch Font Collection Manager; Flags: postinstall nowait skipifsilent unchecked
Filename: {app}\FontMassive.EXE; Description: Launch FontMassive; Flags: postinstall nowait skipifsilent runminimized unchecked
Filename: {app}\FM3_Data\Readme_ru.txt; Description: View README file; Flags: postinstall shellexec skipifsilent unchecked
Filename: {app}\History.rtf; Description: View Change History; Flags: postinstall shellexec skipifsilent unchecked