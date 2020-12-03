# AdventOfCode 2020 - Day 3 Part 2
$values = get-content .\values.txt
$values=$values.split("`n`r")

function getTreesOnRoute( [int]$right, [int]$down ) {
    $trees = 0
    $y = 0
    for ( $x = $down; $x -lt $values.count; $x += $down ) {
        $y += $right
        if ( $y -gt $values[0].ToCharArray().count - 1 ) { 
            $y = $y - $( $values[0].ToCharArray().count )
        } 
        if ( $values[$x][$y] -eq '#' ) {
            $trees ++
        }
    }
    Write-Host "Trees for $right right, $down down: $trees"
    return $trees
}

write-host "Total trees multiplied: $( `
( getTreesOnRoute -right 1 -down 1 ) * `
( getTreesOnRoute -right 3 -down 1 ) * `
( getTreesOnRoute -right 5 -down 1 ) * `
( getTreesOnRoute -right 7 -down 1 ) * `
( getTreesOnRoute -right 1 -down 2 ) )"