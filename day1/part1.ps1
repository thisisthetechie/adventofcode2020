# AdventOfCode 2020 - Day 1 Part 1
$values = get-content .\values.txt
$values=$values.split("`n`r")

foreach ( $passone in $values ) {
    foreach ( $passtwo in $values ) {
        if ( $passone -gt 0 -and $( [int]$passone + [int]$passtwo ) -eq 2020 ) {
            write-host "$passone + $passtwo = $( [int]$passone + [int]$passtwo )";
            write-host "$passone x $passtwo = $( [int]$passone * [int]$passtwo )";
            exit;
        }
    }
}