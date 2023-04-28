#!/usr/bin/env perl

use v5.36;
use List::Util qw/max/;
use List::MoreUtils qw/slide/;

sub mg {
    my @list = @_;
    return 0 if scalar @list == 1;
    my @slided = slide {$b-$a} @list;
    my $max = max @slided;
    return scalar grep {$max == $_} @slided;
}

use Test::More tests=>2;
ok mg(1,2,5,8) == 2;
ok mg(3) == 0;
