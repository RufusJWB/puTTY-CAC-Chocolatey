$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/NoMoreFood/putty-cac/raw/0.72/binaries/puttycac-0.72-installer.msi'
$url64      = 'https://github.com/NoMoreFood/putty-cac/raw/0.72/binaries/puttycac-64bit-0.72-installer.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'puTTY CAC*'

  checksum      = '731FE6CAED39416D9CD738FE70C1C43C0099B20BF0E5F3A229C8131E21AB3F0A'
  checksumType  = 'sha256'
  checksum64    = '5799EE7200FDB4F1D81ECB3315089576168903569A1AA8DD283D984BBD1B00BC'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs