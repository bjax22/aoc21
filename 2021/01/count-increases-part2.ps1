$sonarfeed = Get-Content -Path ./input.txt
$count = 0
$prevlineA = 0
$prevlineB = 0
$groupsum = 0
$prevGroupSum = 0
foreach($line in $sonarfeed)
{
    if ($prevlineB -eq 0) {}
    else {
        $groupsum = [int]$line + [int]$prevlineA + [int]$prevlineB
        if ($groupsum -gt $prevGroupSum) {$count++}
    }
    write-host "$line, $prevLineA, $prevlineB, sum = $groupsum; old = $prevGroupSum; increases = $count"
#    start-sleep 1
#    if ($line -gt $prevline) {$count += 1 }
#    $prevline = $line
    $prevGroupSum = $groupsum
    $prevlineB = $prevlineA
    $prevlineA = $line
}

#Decrement count by one to remove the first increase from "null"
$count--
write-host $count
