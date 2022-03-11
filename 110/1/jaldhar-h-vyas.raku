#!/usr/bin/env raku

sub MAIN(
    Str $filename = 'phone-numbers.txt'
) {
    my $valid = rx{ 
        ^ \s* ( \+\d ** 2 | \(\d ** 2\) | \d ** 4 ) \s* \d ** 10  \s* $
    };

    $filename.IO.lines.grep({ /$valid/ }).map({ .say; });
}
