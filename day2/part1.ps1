# AdventOfCode 2020 - Day 2 Part 1
$values = get-content .\values.txt
$values=$values.split("`n`r")

$illegalPasswords = 0
$legalPasswords = 0
foreach ( $rule in $values ) {
    $count = $rule.split(" ")[0]
    $countLow = $count.split("-")[0]
    $countHigh = $count.split("-")[1]
    $letter = $rule.split(" ")[1][0]
    $password = $rule.split(" ")[2]

    $instances = ( $password.ToCharArray() | Where-Object { $_ -eq $letter } | Measure-Object).count
    write-host "Low Count: $countLow, High Count: $countHigh, Letter: $letter, Password: $password, Instances: $instances " -NoNewline

    if ( $instances -lt $countLow -or $instances -gt $countHigh ) {
        $illegalPasswords += 1
        write-host -ForegroundColor red "Fail"
    } else {
        $legalPasswords += 1
        write-host -ForegroundColor green "Pass"
    }
}
Write-host "$legalPasswords passwords passed validation"
Write-host "$illegalPasswords passwords failed validation"