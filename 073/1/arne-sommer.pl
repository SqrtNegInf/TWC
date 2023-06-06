#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use List::Util 'min';
use Perl6::Junction 'all';

my $verbose = 0;

GetOptions("verbose"  => \$verbose);

my ($S, @A) =  (3, 1, 5, 0, 2, 9, 3, 7, 6, 4, 8);

die '$S must be an integer >= 1' unless int($S) == $S && $S >= 1;
die '@A must contain integers only' unless all(@A) == qr/^\d+$/;

map { say ": (" . join(", ", @A[$_ .. $_ + $S -1]) . ") min -> " . min @A[$_ .. $_ + $S -1] }
(0 .. @A - $S) if $verbose;

say "(",
    join (", ", map { min @A[$_ .. $_ + $S -1] } (0 .. @A - $S)),
    ")";
