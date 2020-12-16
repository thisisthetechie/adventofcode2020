# AdventOfCode 2020 - Day 3 Part 2
$values = get-content .\values2.txt

$Global:North = 0
$Global:East  = 0
$Global:South = 0
$Global:West  = 0
$Global:Facing = 90 # Starting Direction is East

function processTravel ( $Direction, $Distance ) {
    if     ( $Direction -eq "N" )  { $Global:North += $Distance }
    elseif ( $Direction -eq "E" )  { $Global:East += $Distance }
    elseif ( $Direction -eq "S" )  { $Global:South += $Distance }
    elseif ( $Direction -eq "W" )  { $Global:West += $Distance }
    elseif ( $Direction -eq "L" )  { $Global:Facing -= $Distance }
    elseif ( $Direction -eq "R" )  { $Global:Facing += $Distance }
    elseif ( $Direction -eq "F" )  { 
        Write-Host Facing $Global:Facing
        if ( $Global:Facing -eq 360 ) { $Global:Facing = 0 }
        if ( $Global:Facing -gt 360 ) { $Global:Facing -= 360 }
        if ( $Global:Facing -lt 0 ) { $Global:Facing += 360 }
        if     ( $Global:Facing -eq 0 ) { $Direction = "N" }
        elseif ( $Global:Facing -eq 90 ) { $Direction = "E" }
        elseif ( $Global:Facing -eq 180 ) { $Direction = "S" }
        elseif ( $Global:Facing -eq 270 ) { $Direction = "W" }
        Write-Host Pointing $Direction
        processTravel -Direction $Direction -Distance $Distance        
    }
}

foreach ( $inputCommand in $values ) {
    Write-Host $inputCommand
    $Travel = $inputCommand.Substring(1,$( $inputCommand.length - 1))
    $Direction = $inputCommand[0]
    write-host "Processing $Direction : $Travel"
    processTravel -Direction $Direction -Distance $Travel
}

Write-Host $North
Write-Host $East
Write-Host $South
Write-Host $West
Write-Host $Facing

$AbsNorth = $South - $North
$AbsEast = $East - $West

Write-Host Manhattan = $( $AbsNorth + $AbsEast )