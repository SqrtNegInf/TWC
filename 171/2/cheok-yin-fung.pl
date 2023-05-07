#!/usr/bin/env perl
use v5.36;

sub compose {
    my $f = $_[0];
    my $g = $_[1];
    return sub {
        return $f->($g->(@_));
    }
}


sub multiply {
    return sub {
        my $prod = $_[0]*$_[1];
        return $prod;
    }
}


sub add {
    return sub {
        my $sum = $_[0]+$_[1];
        return $sum;
    }
}


sub inc {
    return sub {
        my $sum = $_[0]+1;
        return $sum;
    }
}


sub double {
    return sub {
        my $prod = $_[0]*2;
        return $prod;
    }
}



use Test::More tests => 9;

for (3..10) {
    ok compose(double, inc)->($_) == double->(inc->($_));
}

ok compose(double, multiply)->(4, 25) == 200;
