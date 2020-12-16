# AdventOfCode 2020 - Day 6 Part 1

$values = Get-Content .\values.txt
Write-Host "Customs Data:"
Write-Host "=============="

$group = @()
$text = ""
foreach ( $row in $values ) {
    if ( $row -ne "" ) {
        $text += $row
    } else {
        $group += $text
        $text = ""
    }
}
$group += $text
$text = ""
$yesCount = 0
foreach ( $form in $group ) { 
    $export = $( $form.ToCharArray() | Select-Object -Unique )
    write-host "Export: $export ($( $export.length ))"
    $yesCount += $export.length
}
write-host Yes Count: $yesCount