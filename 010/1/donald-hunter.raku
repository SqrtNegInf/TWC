#!/usr/bin/env raku

my %r2i =
'I' => 1, 'IV' => 4, 'V' => 5, 'IX' => 9,
'X' => 10, 'XL' => 40, 'L' => 50, 'XC' => 90,
'C' => 100, 'D' => 500, 'CM' => 900, 'M' => 1000;

my %i2r = %r2i.antipairs;

encode 56;
decode 'LVI';

sub decode(Str $roman) { 
    say [+] %r2i{ $roman.split(%r2i.keys, :v).grep(*.Bool) } 
}

sub encode(Int $number is copy where 0 <= $number <= 3999) {
    say [~] gather {
        for %i2r.keys.sort: -* -> $radix {
            take %i2r{$radix} x $number / $radix;
            $number %= $radix;
        }
    }
}
