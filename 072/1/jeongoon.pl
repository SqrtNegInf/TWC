#!/usr/bin/env perl
use v5.36;

use bigint;

my $N = 20;

if ( $N < 1 ) {
    warn "Invalid: N < 1: sould be >= 1: using 1";
    $N = 1;
}

if ( not defined $N ) {
    warn "use default value: 10.\n";
    $N = 10;
}

sub f {
    return 1 if $_[0] == 1; # $_[0] < 1 is filtered above
    return $_[0] * f ($_[0]-1);
}

sub zero_length::f_and_count {
    # make a (big) number
    # take only zeros from the end
    # and return length of it
    ( my $n = f( $_[0] ) ) =~ m/(0+$)/;
    length $1 || 0
}

sub zero_length::reduce ($) {
    my $z = 0; # put this line here for better indention in CPerl Mode

    map {
        my $i = 0;
        ( ++$z, ++$i ) while not $_ % ( 5**($i+1) );
        $N == $_? $z :();
    } 1 .. $N;
}

print "Counted:   ", zero_length::f_and_count( $N ), $/;
print "Caculated: ", zero_length::reduce( $N ), $/;
