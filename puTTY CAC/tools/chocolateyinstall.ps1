$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/NoMoreFood/putty-cac/raw/master/binaries/puttycac-0.71-installer.msi'
$url64      = 'https://github.com/NoMoreFood/putty-cac/raw/master/binaries/puttycac-64bit-0.71-installer.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'puTTY CAC*'

  checksum      = '72165571A3BBE5C0B4D34C1D1AD7A7E634EDB78718B492BA35A33BAFEF879213'
  checksumType  = 'sha256'
  checksum64    = '22586A538C5FE74150322A3F0FFCD5FE02F061290B0DF9DBD40AF2B745CF6B58'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs