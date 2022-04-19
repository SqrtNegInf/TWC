#!/usr/bin/env raku

grammar VIN {
  token TOP  { <WMI> <VDS> <VIS> }
  token WMI  { <.char> ** 3 }
  token VDS  { <.char> ** 6 }
  token VIS  { <.char> ** 8 }
  token char { <[A..H J..N P R..Z 0..9]> }
}

sub MAIN (
  Str $VIN = 'JTHBE96S280041733', #= 17 character Vehicle Identification Number
  --> Nil
) { VIN.parse($VIN).say }
