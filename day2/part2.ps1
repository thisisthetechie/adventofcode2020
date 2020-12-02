# AdventOfCode 2020 - Day 2 Part 2
$values = get-content .\values.txt
$values=$values.split("`n`r")

$illegalPasswords = 0
$legalPasswords = 0
foreach ( $rule in $values ) {
    $position = $rule.split(" ")[0]
    $firstPosition = [int]$position.split("-")[0] -1
    $secondPosition = [int]$position.split("-")[1] -1
    $letter = $rule.split(" ")[1][0]
    $password = $rule.split(" ")[2]

    write-host "First Position: $firstPosition ($($password[$firstPosition])), Second Position: $secondPosition ($($password[$secondPosition])), Letter: $letter, Password: $password " -NoNewline

    if ( $password[$firstPosition] -eq $letter -and $password[$secondPosition] -ne $letter ) {
        $legalPasswords += 1
        write-host -ForegroundColor green "Pass"
    } elseif ( $password[$firstPosition] -ne $letter -and $password[$secondPosition] -eq $letter )  {
        $legalPasswords += 1
        write-host -ForegroundColor green "Pass"
    } else {
        $illegalPasswords += 1
        write-host -ForegroundColor red "Fail"
    }
}
Write-host "$legalPasswords passwords passed validation"
Write-host "$illegalPasswords passwords failed validation"