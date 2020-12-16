# AdventOfCode 2020 - Day 4 Part 2
Clear-Host 
$values = Get-Content .\values.txt
Write-Host "Passport Data:"
Write-Host "=============="

$validPassports = 0
$c = 1
$passport = ""
$passports = @{}
$passports[$c] = @{}
foreach ( $row in $values ) {
    
    if ( $row -ne "" ) {
        $ts = $row.split(" ")
        foreach ( $item in $ts ) {
            if ( $item.split(':')[0] -ne 'cid') {
                $passports[$c].add($item.split(':')[0],$item.split(':')[1])
            }
        }
            
    } else {
        #write-host $c = $passports[$c].Values
        $c++
        $passports[$c] = @{}
    }
}
#write-host $c = $passports[$c].Values
#write-host Passport Count: $passports.count
#write-host
foreach ( $passport in $passports ) { $passport.count}
for ( $i = 1; $i -le $passports.count; $i++ ) {
    #write-host $i 
    #write-host $passports[$i].Values
    write-host $passports[$i]['pid']

    if ( ( $passports[$i].Count -eq 7 ) `
            -and ( $passports[$i]['byr'] -match "^(19[2-9]\d|20[0][12])$" ) `
            -and ( $passports[$i]['iyr'] -match "^(201[0-9]|2020)$" ) `
            -and ( $passports[$i]['eyr'] -match "^(202[0-9]|2030)$" ) `
            -and ( $passports[$i]['hgt'] -match "^(\d{2}in)|((1[5-8]\d|19[0-3])cm)$" ) `
            -and ( $passports[$i]['hcl'] -match "^(#[0-9a-f]{6})$" ) `
            -and ( $passports[$i]['ecl'] -match "^(amb|blu|brn|gr[y|n]|hzl|oth)$" ) `
            -and ( $passports[$i]['pid'] -match "^([0-9]{9})$" ) ) {
            $validPassports++
        }
}
Write-host $validPassports passports are valid

