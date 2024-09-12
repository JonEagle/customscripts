$blobfile = $args[0]
$blobs = Get-Content $blobfile

Write-Host
Write-Host
Write-Host
Write-Host \/##############################\/ BlobFileList v1.0 \/##############################\/
Write-Host
Write-Host
Write-Host

foreach ($blob in $blobs) {
Write-Host "Getting file URL list for $blob"
Write-Host
curl.exe $blob | select-string '(?<=<Url>)(.*?)(?=<\/Url>)' -AllMatches | % { $_.Matches } | % {$_.Value} >> listofblobfiles.txt
Write-Host
}