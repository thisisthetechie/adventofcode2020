# AdventOfCode 2020 - Day 7 Part 1

$values = Get-Content .\values.txt
$bagType = "shiny gold"
$totalBags = @()

function getBags ( $bagType, $totalBags) {
    foreach ( $bag in $values.replace(",","").replace(" bags contain ", ",") ) {
        $bag=$bag.split(",")
        if ( $bag[1].contains($bagType) ) { 
            $global:totalBags += $bag[0]
            getBags $bag[0]

        }
    }
}

getBags $bagType

write-host Total Bags: $( $totalBags | Select-Object -Unique ).count