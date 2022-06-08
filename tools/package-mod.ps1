Set-StrictMode -Version 3
$multiple=$false
if($multiple) {
	Get-ChildItem "$PSScriptRoot\ovl\release" -Directory | ForEach-Object {Compress-Archive "$PSScriptRoot\ovl\release\$_\*" -DestinationPath $PSScriptRoot\$_.zip}
}
else {Compress-Archive "$PSScriptRoot\ovl\release\*" -DestinationPath $PSScriptRoot}