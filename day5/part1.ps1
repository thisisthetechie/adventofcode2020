# AdventOfCode 2020 - Day 5 Part 1

$seats = Get-Content .\values.txt
$totalSeats = @()
foreach ( $seat in $seats ) {
    $rowMin = 0
    $rowMax = 127
    $colLeft = 0
    $colRight = 7
    foreach ( $function in $seat.ToCharArray() ) {
        switch ( $function ) {   
            "B" { 
                $rowMin = [math]::ceiling($( ($rowMax - $rowMin) / 2 ) + $rowMin) 
                break
            }
            "F" { 
                $rowMax = [math]::floor($( ($rowMax - $rowMin) /2 ) + $rowMin ) 
                break
            }
            "R" {
                $colLeft = [math]::ceiling($( ($colRight - $colLeft) / 2 ) + $colLeft) 
                break
            }
            "L" {
                $colRight = [math]::floor($( ($colRight - $colLeft) / 2 ) + $colLeft) 
                break
            }
        }
    }

    if (( $rowMin -eq $rowMax ) -and ( $colLeft -eq $colRight )) {
        $row = $rowMin
        $column = $colLeft
        $seatId = $row * 8 + $column
        $totalSeats += $seatId
        Write-Host $($seat): row $row column $column ID $seatId
    }
}

write-host $($totalSeats | Measure-Object -Maximum).Maximum
