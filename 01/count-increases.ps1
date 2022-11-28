$sonarfeed = Get-Content -Path ./input.txt
$count = 0
$prevline = 0
foreach($line in $sonarfeed)
{
    if ($line -gt $prevline) {$count += 1 }
    $prevline = $line
}
write-host $count