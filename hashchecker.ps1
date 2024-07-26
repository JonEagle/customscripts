$userfile = $args[0]
$hashfile = $args[1]
$potfile = $args[2]
$usercontent = Get-Content $userfile
$hashcontent = Get-Content $hashfile
$potcontent = Get-Content $potfile

Write-Host
Write-Host
Write-Host
Write-Host \/##############################\/ Hashchecker v1.0 \/##############################\/
Write-Host
Write-Host
Write-Host

If ([String]::IsNullOrWhitespace($userfile)) {
Write-Host "Instructions: Please add three arguments in this order - user file, hash file, pot file e.g. '.\hashchecker.ps1 userfile.txt hashfile.txt potfile.potfile'"
Write-Host }
If ([String]::IsNullOrWhitespace($hashfile)) {
Write-Host "Instructions: Please add three arguments in this order - user file, hash file, pot file e.g. '.\hashchecker.ps1 userfile.txt hashfile.txt potfile.potfile'"
Write-Host }
If ([String]::IsNullOrWhitespace($potfile)) {
Write-Host "Instructions: Please add three arguments in this order - user file, hash file, pot file e.g. '.\hashchecker.ps1 userfile.txt hashfile.txt potfile.potfile'"
Write-Host }


foreach ($user in $usercontent) {
$wantedhash = Get-Content $hashfile | findstr /i $user
foreach ($wantedhash2 in $wantedhash) {
$strippedhash = $wantedhash2 -replace ".*e:" -replace ":::"
$strippeduser = ($wantedhash2.Split(':'))[0]
$pass = Get-Content $potfile | findstr $strippedhash
If ([String]::IsNullOrWhitespace($pass)) {
Write-Host $user "NOT CRACKED" 
Write-Host 
} else {
Write-Host $strippeduser "CRACKED" 
Write-Host $pass 
Write-Host 
}
}
}