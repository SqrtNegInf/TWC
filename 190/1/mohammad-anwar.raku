#!/usr/bin/env raku

use Test;

ok  capital_detection('Perl'),   'Example 1';
ok  capital_detection('TPF'),    'Example 2';
ok !capital_detection('PyThon'), 'Example 3';
ok  capital_detection('raku'),   'Example 4';

done-testing;

#
#
# METHOD

sub capital_detection(str $str) {
    return ($str ~~ /^<[A..Za..z]>+$/)
           && (($str ~~ /^<[A..Z]><[a..z]>+$/)
               ||
               ($str ~~ /^<[a..z]>+$/)
               ||
               ($str ~~ /^<[A..Z]>+$/));
}
