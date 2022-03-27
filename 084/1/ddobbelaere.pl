#!/usr/bin/env perl

use v5.20;
use strict;
use warnings;
use feature qw(signatures);
no warnings qw(experimental::signatures);

#<<<
sub reverse_integer($N) {
    my $M = reverse abs $N, '-'x($N<0);
    $M*(-2**31<=$M<2**31);
}
#>>>

my $int = qr/-?\d+/;

#if ( @ARGV && $ARGV[0] =~ /^$int$/ ) {
    say reverse_integer( -1700    );
#}
#else {
#    say "Usage: $0 <Integer>";
#}

# Tests.
while ($_ = <DATA>) {
    if (/^($int)\s+($int)$/) {
        my $actual = reverse_integer($1);
        $2 eq $actual || die "Error for $1. Expected $2, got $actual.";
    }
}

__END__
1234 4321
-1234 -4321
1231230512 0
