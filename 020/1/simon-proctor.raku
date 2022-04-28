#!/usr/bin/env raku

#| Takes a string and outputs it broken into sets of the same character
multi sub MAIN ( Str $input is copy = 'bookkeeper') {
    while my $m = $input ~~ s!^$<match>=((.)$0*)!! {
        $m<match>.Str.say;
    }
}
