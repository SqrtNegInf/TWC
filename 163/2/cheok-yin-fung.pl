#!/usr/bin/env perl
use v5.36;

say compute(@ARGV) if defined($ARGV[0]);

sub compute {
    my @v = @_;
    my $NUM = scalar @v;

    my @new_v;

    for my $r (1..$NUM-1) {
        @new_v = ();
        $new_v[0] = $v[1];
        for my $next (1..$NUM-$r-1) {
            $new_v[$next] = $new_v[$next-1] + $v[$next+1];
        }
        @v = @new_v;
    }

    return $new_v[0];
}

use Test::More tests => 2;
ok compute(1,2,3,4,5) == 42;
ok compute(1,3,5,7,9) == 70;
