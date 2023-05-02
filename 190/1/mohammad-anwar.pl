#!/usr/bin/env perl

use v5.36;
use Test2::V0 -srand => 1;

ok  capital_detection('Perl'),   'Example 1';
ok  capital_detection('TPF'),    'Example 2';
ok !capital_detection('PyThon'), 'Example 3';
ok  capital_detection('raku'),   'Example 4';

done_testing;

#
#
# METHOD

sub capital_detection {
    $_ = $_[0];
    return (/^[A-Za-z]+$/)
            && ((/^[A-Z][a-z]+$/) || (/^[a-z]+$/) || (/^[A-Z]+$/));
}
