#define MyAppName "FIcon"
#define MyAppVersion "1.1.0.0"
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
Source: "..\IcoFiles\*"; DestDir: "{app}{\}icons"; Flags: ignoreversion
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
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagCherry"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Cherry"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagCherry"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_cherry.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagCherry\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\b_TagCherry\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:cherry ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagRed"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Red"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagRed"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_red.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagRed\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\c_TagRed\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:red ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagOrange"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Orange"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagOrange"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_orange.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagOrange\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\d_TagOrange\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:orange ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagYellow"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Yellow"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagYellow"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_yellow.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagYellow\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\e_TagYellow\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:yellow ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagGreen"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Green"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagGreen"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_green.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagGreen\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\f_TagGreen\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:green ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagMint"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Mint"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagMint"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_mint.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagMint\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\g_TagMint\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:mint ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBabyblue"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Babyblue"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBabyblue"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_babyblue.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBabyblue\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\h_TagBabyblue\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:babyblue ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagAqua"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Aqua"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagAqua"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_aqua.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagAqua\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\i_TagAqua\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:aqua ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagBlue"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "B&lue"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagBlue"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_blue.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagBlue\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\j_TagBlue\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:blue ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagPurple"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&Purple"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagPurple"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_purple.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagPurple\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\k_TagPurple\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:purple ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagPink"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "P&ink"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagPink"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_pink.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagPink\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\l_TagPink\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:pink ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagWhite"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&White"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagWhite"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_white.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagWhite\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\m_TagWhite\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:white ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagBlack"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "Bl&ack"
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagBlack"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_black.ico"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagBlack\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\n_TagBlack\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:black ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\o_TagCustom"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "C&ustom image..."
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\o_TagCustom"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000020
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\o_TagCustom\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\o_TagCustom\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:custom ""%1"""

Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\p_TagAbout"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "A&bout FIcon..."
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\p_TagAbout"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000020
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\p_TagAbout"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}FIcon.exe"""
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\p_TagAbout\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\p_TagAbout\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /About"

[UninstallDelete]
Type: filesandordirs; Name: "{userappdata}\ficon\generated_icons"

[Messages]
ConfirmUninstall=Do you want to remove %1 from your computer? The menu entry "FIcon" won't be available and all folder icons set with FIcon will revert to the default icon. Continue?

[Code]
function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1'          .NET Framework 1.1
//    'v2.0'          .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//    'v4.5'          .NET Framework 4.5
//    'v4.5.1'        .NET Framework 4.5.1
//    'v4.5.2'        .NET Framework 4.5.2
//    'v4.6'          .NET Framework 4.6
//    'v4.6.1'        .NET Framework 4.6.1
//    'v4.6.2'        .NET Framework 4.6.2
//    'v4.7'          .NET Framework 4.7
//    'v4.7.1'        .NET Framework 4.7.1
//    'v4.7.2'        .NET Framework 4.7.2
//    'v4.8'          .NET Framework 4.8
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
    key, versionKey: string;
    install, release, serviceCount, versionRelease: cardinal;
    success: boolean;
begin
    versionKey := version;
    versionRelease := 0;

    // .NET 1.1 and 2.0 embed release number in version key
    if version = 'v1.1' then begin
        versionKey := 'v1.1.4322';
    end else if version = 'v2.0' then begin
        versionKey := 'v2.0.50727';
    end

    // .NET 4.5 and newer install as update to .NET 4.0 Full
    else if Pos('v4.', version) = 1 then begin
        versionKey := 'v4\Full';
        case version of
          'v4.5':   versionRelease := 378389;
          'v4.5.1': versionRelease := 378675; // 378758 on Windows 8 and older
          'v4.5.2': versionRelease := 379893;
          'v4.6':   versionRelease := 393295; // 393297 on Windows 8.1 and older
          'v4.6.1': versionRelease := 394254; // 394271 before Win10 November Update
          'v4.6.2': versionRelease := 394802; // 394806 before Win10 Anniversary Update
          'v4.7':   versionRelease := 460798; // 460805 before Win10 Creators Update
          'v4.7.1': versionRelease := 461308; // 461310 before Win10 Fall Creators Update
          'v4.7.2': versionRelease := 461808; // 461814 before Win10 April 2018 Update
          'v4.8':   versionRelease := 528040; // 528049 before Win10 May 2019 Update
        end;
    end;

    // installation key group for all .NET versions
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + versionKey;

    // .NET 3.0 uses value InstallSuccess in subkey Setup
    if Pos('v3.0', version) = 1 then begin
        success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
    end else begin
        success := RegQueryDWordValue(HKLM, key, 'Install', install);
    end;

    // .NET 4.0 and newer use value Servicing instead of SP
    if Pos('v4', version) = 1 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
    end else begin
        success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
    end;

    // .NET 4.5 and newer use additional value Release
    if versionRelease > 0 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Release', release);
        success := success and (release >= versionRelease);
    end;

    result := success and (install = 1) and (serviceCount >= service);
end;

function InitializeSetup(): Boolean;
begin
    if not IsDotNetDetected('v4.7.2', 0) then begin
        MsgBox('This software requires Microsoft .NET Framework 4.7.2.'#13#13
            'Please visit'#32
            'https://dotnet.microsoft.com/download/dotnet-framework/net472'#32
            'and download and install "Runtime",'#32
            'and then run the setup program again.', mbInformation, MB_OK);
        result := false;
    end else
        result := true;
end;

var
  ResultCode: Integer;
procedure cPostInstall();
begin
  Exec('ie4uinit.exe', '-show', '', SW_SHOW, ewWaitUntilTerminated, ResultCode);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    cPostInstall();
  end;
end;
