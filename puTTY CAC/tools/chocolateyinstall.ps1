$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/NoMoreFood/putty-cac/raw/0.74/binaries/puttycac-0.74-installer.msi'
$url64      = 'https://github.com/NoMoreFood/putty-cac/raw/0.74/binaries/puttycac-64bit-0.74-installer.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'puTTY CAC*'

  checksum      = 'E47526DB93933B961C0D5DA59112AED28504B77C47DEBD0921252DAF0655BEA2'
  checksumType  = 'sha256'
  checksum64    = '2AEDF0FC5B97AC524F2BC5B150C4D4B963D588C65F7BDE92D0F4B55D895700E7'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
