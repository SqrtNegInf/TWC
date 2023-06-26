#!/usr/bin/env perl
use v5.36;

use utf8;
binmode(STDOUT, ":utf8");

use Unicode::Normalize;

sub makeover {
    return join '', map { /(.)/ } map { /(\X)/g } NFD shift;
}

for my $test ('ÃÊÍÒÙ', 'âÊíÒÙ', 'àçùòîéèûä' ) {
    say "$test -> \t", makeover($test);
}
