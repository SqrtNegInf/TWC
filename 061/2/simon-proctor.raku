#!/usr/bin/env raku

#| Print all valid IPv4 addresses from the given string
#| Will output nothing if no valid IPv4 address can be made from the given string
sub MAIN(
    Str $possible where * ~~ /^ <[0..9]> ** 4..12 $/ = '25525511135'
){
    for $possible ~~ m:ex/^ ( <[0..9]> ** 1..3 ) ** 4 $/ -> $match {
        my @vals = $match[0].map(*.Str);
        next unless all( @vals.map( { $_ ~~ $_.Int.Str && 0 <= $_ <= 255 } ) );
        say @vals.join('.');
    }
}
