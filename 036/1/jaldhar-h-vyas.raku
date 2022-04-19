#!/usr/bin/env raku

sub validateVIN(Str $vin) {

    if ($vin.chars != 17) {
        return False;
    }

    if $vin !~~ /^
        <alnum> ** 3 # World Manufacturer Identifier
        <alnum> ** 6 # Vehicle Descriptor Section
        <alnum> ** 8 # Vehicle Identifier Section
    $/ {
        return False;
    }

    return True;
}

multi sub MAIN(Str $vin = 'JTHBE96S280041733') {

    say (validateVIN($vin) ?? 'VALID' !! 'INVALID');
}
