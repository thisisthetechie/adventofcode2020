# AdventOfCode 2020 - Day 6 Part 2

$values = Get-Content .\values.txt
Write-Host "Customs Data:"
Write-Host "=============="

$group = @()
$text = ""
foreach ( $row in $values ) {
    if ( $row -ne "" ) {
        $text += "$row,"
    } else {
        $group += $text
        $text = ""
    }
}

$group += $text
write-host $text
$text = ""
$yesCount = 0

write-host $group

foreach ( $sub in $group ) { 
    $teamCount = $sub.split(",").count - 1
    foreach ( $entry in $( $sub.replace(",","").ToCharArray() | Select-Object -Unique )) {
        write-host $sub : $entry : ($teamCount) : $(([regex]::Matches($sub, $entry )).count)
        if ( $(([regex]::Matches($sub, $entry )).count) -eq $teamCount) {
            $yesCount ++
        }
    }
}

write-host Yes Count: $yesCount