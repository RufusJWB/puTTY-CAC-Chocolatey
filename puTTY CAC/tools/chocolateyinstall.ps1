$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/NoMoreFood/putty-cac/raw/0.73/binaries/puttycac-0.73-installer.msi'
$url64      = 'https://github.com/NoMoreFood/putty-cac/raw/0.73/binaries/puttycac-64bit-0.73-installer.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'puTTY CAC*'

  checksum      = 'D442E87A100F2D4C4056B368B9A00F763ED4351712EEB805739C3DF143B79E9E'
  checksumType  = 'sha256'
  checksum64    = 'BB534F888DEA7150ABDA5249C393D41E64F57B9396BCBB44AABF85A06BAC412A'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs