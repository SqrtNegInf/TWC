#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my $n = 7;
say S($n);

sub S($n) {
    my $S = '';
    for my $i (1..$n) {
        $S .= '0' . switch(rev($S));
    }
    return $S;
}

sub switch($s) {
    $s =~ tr/01/10/;
    return $s;
}

sub rev($s) {
    return scalar reverse $s;
}
