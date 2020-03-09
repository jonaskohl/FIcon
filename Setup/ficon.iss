#define MyAppName "FIcon"
#define MyAppVersion "1.0.0.0"
#define MyAppPublisher "Jonas Kohl"
#define MyAppURL "https://jonaskohl.de/l/?a=fi"

[Setup]
AppId={{05A3AACD-ECA9-4A2D-9B8B-B741F2DBA814}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=.\
OutputBaseFilename=ficon-setup
Compression=lzma
SolidCompression=yes
DisableWelcomePage=False
MinVersion=0,6.1
UninstallDisplayName=FIcon
UninstallDisplayIcon={app}\FIcon.exe
WizardSmallImageFile=ficon_setup.bmp
WizardImageFile=ficon_WizModernImage.bmp
LicenseFile=license.rtf

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "..\bin\Release\icons\*"; DestDir: "{app}{\}icons"; Flags: ignoreversion
Source: "..\bin\Release\FIcon.exe"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey; ValueType: string; ValueName: "MuiVerb"; ValueData: "&Tag"
Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey; ValueType: string; ValueName: "SubCommands"; ValueData: 
Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}FIcon.exe"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&None"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_default.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000040


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Untag ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagRed"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Red"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagRed"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_red.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagRed\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagRed\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:red ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagOrange"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Orange"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagOrange"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_orange.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagOrange\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagOrange\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:orange ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagYellow"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Yellow"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagYellow"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_yellow.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagYellow\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagYellow\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:yellow ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagGreen"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Green"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagGreen"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_green.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagGreen\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagGreen\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:green ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagMint"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "Mi&nt"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagMint"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_mint.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagMint\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagMint\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:mint ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagAqua"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Aqua"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagAqua"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_aqua.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagAqua\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagAqua\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:aqua ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBlue"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Blue"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBlue"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_blue.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBlue\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBlue\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:blue ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagPurple"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Purple"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagPurple"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_purple.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagPurple\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagPurple\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:purple ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagPink"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "P&ink"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagPink"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_pink.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagPink\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagPink\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:pink ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagWhite"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&White"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagWhite"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_white.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagWhite\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagWhite\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:white ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagBlack"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "B&lack"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagBlack"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_black.ico"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagBlack\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagBlack\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:black ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagCustom"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "Cu&stom image..."
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagCustom"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000020

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagCustom\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagCustom\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:custom ""%1"""


Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagAbout"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "Abo&ut FIcon..."
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagAbout"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000020
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagAbout"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}FIcon.exe"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagAbout\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagAbout\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /About"

[UninstallDelete]
Type: filesandordirs; Name: "{userappdata}\ficon\generated_icons"

[Messages]
ConfirmUninstall=Do you want to remove %1 from your computer? The menu entry "FIcon" won't be available and all folder icons set with FIcon will revert to the default icon. Continue?