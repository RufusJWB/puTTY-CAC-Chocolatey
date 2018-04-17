
$ErrorActionPreference = 'Stop';

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/NoMoreFood/putty-cac/raw/0.70u4/binaries/puttycac-0.70u4-installer.msi'
$url64      = 'https://github.com/NoMoreFood/putty-cac/raw/0.70u4/binaries/puttycac-64bit-0.70u4-installer.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url64

  softwareName  = 'puTTY CAC*'

  checksum      = '8B125E64851B261EC5065C533709A973E85299432EC6FA52EE17C9BF41EB88F4'
  checksumType  = 'sha256'
  checksum64    = '8CCED1ED3CA71F82AEBFB419ADDAF2FF74BAFA3B8D56792BCB5A2225213C834E'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs










    








