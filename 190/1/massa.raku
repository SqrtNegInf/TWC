#!/usr/bin/env raku

use Test;

my regex capital-detection { ^ [ <upper> <lower>* | <upper>+ | <lower>+ ] $ }

ok  'Perl' ~~    /<capital-detection>/;
ok  'TPF' ~~     /<capital-detection>/;
nok 'PyThon' ~~  /<capital-detection>/;
ok  'raku' ~~    /<capital-detection>/;

done-testing;


