#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw/slide/;

sub ro {
    my @ints = @_;
    my @diff = slide {$b-$a} @ints;
    my $k = grep {$_ <= 0} @diff;
    return $k<=1 ? 1 : 0;
}

use Test::More tests=>6;
ok ro(0,2,9,4,6);
ok !ro(5,1,3,2);
ok ro(2,2,3);
ok ro(1,2,5,4,5);
ok ro(1,2,1,4,5);
ok !ro(1,2,1,1,5);
