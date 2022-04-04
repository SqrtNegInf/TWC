#!/usr/bin/env raku

my $SN = q{};

$SN ~= "0" ~ $SN.flip.trans("01" => "10") for ^7;
    
say $SN;
