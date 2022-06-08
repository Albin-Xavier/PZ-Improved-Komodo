Set-StrictMode -Version 3
if( -not (Test-Path -Path $PSScriptRoot\GIMP\bin)) {
	winget install GIMP --source winget --location $PSScriptRoot\GIMP
}
Write-Host "GIMP installed!"

# Winget isn't used for Blender because it will not respect the --location flag.
# Make sure to update Blender version when Blender updates, but check for breaking changes.
if ( -not (Test-Path -Path $PSScriptRoot\blender-3.1.2-windows-x64\blender.exe -Pathtype Leaf)) {
	Invoke-WebRequest -uri https://download.blender.org/release/Blender3.1/blender-3.1.2-windows-x64.zip -OutFile $PSScriptRoot\blender-3.1.2.zip
	Expand-Archive -LiteralPath $PSScriptRoot\blender-3.1.2.zip -DestinationPath $PSScriptRoot\
	Remove-Item $PSScriptRoot\blender-3.1.2.zip
}
Write-Host "Blender installed!"

if( -not (Test-Path -Path $PSScriptRoot\cobra-tools)) {
	git clone https://github.com/OpenNaja/cobra-tools
	Set-Location cobra-tools
	git reset --hard 2ced7f508b0cba86a02da59fe34f6ef38b574702
	Set-Location $PSScriptRoot
}

if( -not (Test-Path -Path $PSScriptRoot\blender-3.1.2-windows-x64\3.1\scripts\addons\cobra-tools)) {
	Copy-Item -Path $PSScriptRoot\cobra-tools -Destination $PSScriptRoot\blender-3.1.2-windows-x64\3.1\scripts\addons -Recurse
}

Write-Host "Cobra Tools installed!"
Read-Host "Setup complete! Make sure to enable the cobra tools plugin within Blender. Press any key to exit"
