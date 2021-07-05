$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/NoMoreFood/putty-cac/raw/0.75u1/binaries/puttycac-0.75u1-installer.msi'
$url64      = 'https://github.com/NoMoreFood/putty-cac/raw/0.75u1/binaries/puttycac-64bit-0.75u1-installer.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'puTTY CAC*'

  checksum      = '397809F0C81F8A1E8D22D658A777DD491310B5831D286C1A985712C880F3710F'
  checksumType  = 'sha256'
  checksum64    = 'F19773A5154CECED54CDCB935759C0961F317E90F61E9B2A597E74264BC88308'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
