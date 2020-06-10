$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/NoMoreFood/putty-cac/raw/0.73u2/binaries/puttycac-0.73u2-installer.msi'
$url64      = 'https://github.com/NoMoreFood/putty-cac/raw/0.73u2/binaries/puttycac-64bit-0.73u2-installer.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'puTTY CAC*'

  checksum      = '5A1FE9A65BADDF547C14CF1F9F9A2121AF0AF2BE3B286E32C877D5202B1BFE5C'
  checksumType  = 'sha256'
  checksum64    = 'DEBA3E66D73B4A04923C052DE58B903FEA6010C786D3B23661B841907B9BB6BF'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs