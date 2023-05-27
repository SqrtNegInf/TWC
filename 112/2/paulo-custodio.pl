#!/usr/bin/env perl
use v5.36;

use Modern::Perl;

my $n = shift || 10;
say count($n);

sub count {
    my($n) = @_;
    if ($n <= 0) {
        return 0;
    }
    elsif ($n == 1) {
        return 1;
    }
    elsif ($n == 2) {
        return 2;
    }
    else {
        return count($n-1)+count($n-2);
    }
}
