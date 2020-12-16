# AdventOfCode 2020 - Day 4 Part 1
Clear-Host 
$values = Get-Content .\values.txt
Write-Host "Passport Data:"
Write-Host "=============="

$validPassports = 1

$passport = @{}
foreach ( $row in $values ) {
    
    if ( $row -ne "" ) {
        $ts = $row.split(" ")
        foreach ( $item in $ts ) {
            if ( $item.split(':')[0] -ne 'cid') {
                $passport.add($item.split(':')[0],$item.split(':')[1])
            }
        }
    } else {
        write-host $passport['pid'] contains $passport.count entries
        if ( $passport.Count -eq 7 ) {
            $validPassports++
        }
        $passport = @{}
    }
}
Write-host "$validPassports passports are valid"

