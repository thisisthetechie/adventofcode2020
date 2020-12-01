# $values from advent list
$values=$values.split("`n`r")

foreach ( $passone in $values ) {
 foreach ( $passtwo in $values ) {
  if ( [int]$passone + [int]$passtwo -eq 2020 ) {
    write-host $passone
  }
 }
}
