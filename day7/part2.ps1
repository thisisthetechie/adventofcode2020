# AdventOfCode 2020 - Day 7 Part 2

$values = Get-Content .\values3.txt
$bagType = "shiny gold"
$totalBags = @()
$myBags = @{}

foreach ( $bag in $values.replace(",","").replace(" bags contain ", ",").replace(", ",",") ) {
    $bag=$bag.split(",")
    $global:myBags.Add($bag[0],$bag[1])
    if ( $bag[1].contains($bagType) ) { 
        $global:totalBags += $bag[0]

    }
}
<#
function getBags ( $bagType, $totalBags) {
    foreach ( $bag in $values.replace(",","").replace(" bags contain ", ",").replace(", ",",") ) {
        $bag=$bag.split(",")
        $global:myBags.Add($bag[0],$bag[1])
        if ( $bag[1].contains($bagType) ) { 
            $global:totalBags += $bag[0]
            getBags $bag[0]

        }
    }
}

getBags $bagType#>

write-host Total Bags: $( $totalBags | Select-Object -Unique ).count