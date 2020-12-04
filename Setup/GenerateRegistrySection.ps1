$ColorNames = [Collections.Generic.List[String]]((Get-Content .\IconColors.txt -Raw).Split([Environment]::NewLine))

if ($ColorNames.Count -gt 13) {
    Write-Host "[Error] More than 16 total entries (more than 13 colors)"
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()
    [System.Windows.Forms.MessageBox]::Show("More than 16 total entries (more than 13 colors)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit
}

$LetterIndex = 1

$UsedAccelerators = [Collections.Generic.List[String]]::new()

$UsedAccelerators.Add("N")

$Buffer = [System.Text.StringBuilder]::new()
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey; ValueType: string; ValueName: "MuiVerb"; ValueData: "&Tag"')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey; ValueType: string; ValueName: "SubCommands"; ValueData: ')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}FIcon.exe"""')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "&None"')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_default.ico"""')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000040')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault\command"; Flags: uninsdeletekey')
[void]$Buffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\a_TagDefault\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Untag ""%1"""')

foreach ($ColorName in $ColorNames) {
    $AcceleratorIndex = 0
    $Accelerator = $ColorName[0]
    while ($UsedAccelerators.Contains($Accelerator)) {
        $AcceleratorIndex++
        $Accelerator = $ColorName[$AcceleratorIndex]
    }
    $UsedAccelerators.Add($Accelerator)
    $MenuColor = $ColorName.Substring(0, $AcceleratorIndex) + '&' + $ColorName.Substring($AcceleratorIndex)
    $FileColor = ([string]$ColorName).ToLower()
    $CommandColor = $FileColor
    $LocalBuffer = [System.Text.StringBuilder]::new()
    [void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_Tag#COLOR#"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "#MENUCOLOR#"')
    [void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_Tag#COLOR#"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}icons\folder_#FILECOLOR#.ico"""')
    [void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_Tag#COLOR#\command"; Flags: uninsdeletekey')
    [void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_Tag#COLOR#\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:#COMMANDCOLOR# ""%1"""')
    $LocalBufferResult = $LocalBuffer.ToString()
    $LocalBufferResult = $LocalBufferResult.Replace("#LETTER#", ([char](97 + $LetterIndex)).ToString())
    $LocalBufferResult = $LocalBufferResult.Replace("#COLOR#", $ColorName)
    $LocalBufferResult = $LocalBufferResult.Replace("#MENUCOLOR#", $MenuColor)
    $LocalBufferResult = $LocalBufferResult.Replace("#COMMANDCOLOR#", $CommandColor)
    $LocalBufferResult = $LocalBufferResult.Replace("#FILECOLOR#", $FileColor)
    [void]$Buffer.AppendLine($LocalBufferResult)
    $LetterIndex++
}

$MenuItem = 'Custom image...'
$AcceleratorIndex = 0
$Accelerator = $MenuItem[0]
while ($UsedAccelerators.Contains($Accelerator)) {
    $AcceleratorIndex++
    $Accelerator = $MenuItem[$AcceleratorIndex]
}
$UsedAccelerators.Add($Accelerator)
$MenuItem = $MenuItem.Substring(0, $AcceleratorIndex) + '&' + $MenuItem.Substring($AcceleratorIndex)

$LocalBuffer = [System.Text.StringBuilder]::new()
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagCustom"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "#MENUITEM#"')
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagCustom"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000020')
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagCustom\command"; Flags: uninsdeletekey')
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagCustom\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /Tag:custom ""%1"""')
$LocalBufferResult = $LocalBuffer.ToString()
$LocalBufferResult = $LocalBufferResult.Replace("#LETTER#", ([char](97 + $LetterIndex)).ToString())
$LocalBufferResult = $LocalBufferResult.Replace("#MENUITEM#", $MenuItem)
[void]$Buffer.AppendLine($LocalBufferResult)
$LetterIndex++

$MenuItem = 'About FIcon...'
$AcceleratorIndex = 0
$Accelerator = $MenuItem[0]
while ($UsedAccelerators.Contains($Accelerator)) {
    $AcceleratorIndex++
    $Accelerator = $MenuItem[$AcceleratorIndex]
}
$UsedAccelerators.Add($Accelerator)
$MenuItem = $MenuItem.Substring(0, $AcceleratorIndex) + '&' + $MenuItem.Substring($AcceleratorIndex)

$LocalBuffer = [System.Text.StringBuilder]::new()
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagAbout"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: "#MENUITEM#"')
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagAbout"; Flags: uninsdeletekey; ValueType: dword; ValueName: "CommandFlags"; ValueData: $00000020')
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagAbout"; Flags: uninsdeletekey; ValueType: string; ValueName: "icon"; ValueData: """{app}{\}FIcon.exe"""')
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagAbout\command"; Flags: uninsdeletekey')
[void]$LocalBuffer.AppendLine('Root: HKCR; Subkey: "Folder\shell\FIconTag\Shell\#LETTER#_TagAbout\command"; Flags: uninsdeletekey; ValueType: string; ValueName: ""; ValueData: """{app}{\}FIcon.exe"" /About"')
$LocalBufferResult = $LocalBuffer.ToString()
$LocalBufferResult = $LocalBufferResult.Replace("#LETTER#", ([char](97 + $LetterIndex)).ToString())
$LocalBufferResult = $LocalBufferResult.Replace("#MENUITEM#", $MenuItem)
[void]$Buffer.AppendLine($LocalBufferResult)
$LetterIndex++

$BufferResult = $Buffer.ToString()

[System.IO.File]::WriteAllText("Output.txt", $BufferResult)
