# AdventOfCode 2020 - Day 3 Part 1
$values = get-content .\values.txt
$values=$values.split("`n`r")

$right = 1
$down = 2
$spaces = 0
$trees = 0
$y = 0
for ( $x = $down; $x -lt $values.count; $x += $down ) {
    $y += $right
    if ( $y -gt $values[0].ToCharArray().count - 1 ) { 
        $y = $y - $( $values[0].ToCharArray().count )
    } 
    write-host "Item at $( $x + 1 ), $( $y + 1) = $($values[$x][$y])" 
    if ( $values[$x][$y] -eq '.' ) {
        $spaces ++
    } else {
        $trees ++
    }
}
Write-Host
Write-Host "Spaces on Route: $spaces"
Write-Host "Trees on Route: $trees"