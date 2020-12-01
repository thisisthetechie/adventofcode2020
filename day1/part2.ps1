# AdventOfCode 2020 - Day 1 Part 2
$values = get-content .\values.txt
$values=$values.split("`n`r")

foreach ( $passone in $values ) {
    foreach ( $passtwo in $values ) {
        foreach ( $passthree in $values ) {
            if ( $passone -gt 0 -and $( [int]$passone + [int]$passtwo + [int]$passthree ) -eq 2020 ) {
                write-host "$passone + $passtwo + $passthree = $( [int]$passone + [int]$passtwo + [int]$passthree )"
                write-host "$passone x $passtwo x $passthree = $( [int]$passone * [int]$passtwo * [int]$passthree )"
                exit;
            }
        }
    }
}