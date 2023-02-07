#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

my @arrays = ([1,5,3,6],[2,6,3,5],[1,2,3,4],[2,3,5,7]);

for my $arr (@arrays) {

    my $check = '';

    say "Input: \@array = [@$arr]";

    for (my $x = 0; $x < @$arr; $x++ ) {

        $arr->[$x] % 2 == 0 ? $check .= 'e' : $check .= 'o';

    }

    $check =~ m/ooo/ ? say "Output : 1\n" : say "Output : 0\n";

}
