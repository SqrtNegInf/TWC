#!/usr/bin/env perl
use v5.36;

use List::Util qw(any first pairfirst);
use Scalar::Util qw(looks_like_number);

use Getopt::Long qw(:config auto_help);
use Pod::Usage;

sub combinations ( $count, @pool ) {
    return () if $count == 0 || $count > @pool;
    return map { [$_] } @pool if $count == 1;

    my @combinations;
    while ( @pool && $count <= @pool ) {
        my $elem = shift @pool;
        my @sub_combinations = combinations( $count - 1, @pool );
        push @combinations, map { [ $elem, @$_, ] } @sub_combinations;
    }

    return @combinations;
}

{
    my $TARGET = 7;
    my @NUMBERS = (10, 8, 12, 15, 5);

    my $invalid = first( sub { !looks_like_number( $_ ) || $_ <= 0 || int( $_ ) != $_ }, @NUMBERS );
    pod2usage(
        -exitval => 1,
        message  => "unexpected value in input list: $invalid"
    ) if $invalid;

    my @pair = pair_difference( $TARGET, @NUMBERS );
    my $out  = ( @pair ? 1 : 0 );

    print $out;

    if ( $ENV{DEBUG} && @pair ) {
        printf( ' as %d - %d  = %d', ( sort { $b <=> $a } @pair ), $TARGET );
    }

    print "\n";

    exit 0;
}

sub pair_difference ( $target, @numbers ) {

    # reusing `combinations` from ch-083 again to build our pairs.
    # we will calculate the absolute difference between the pair members so
    # that order of the memebers doesn't matter
    my @pairs = combinations( 2, @numbers );

    # find the first pair whose difference is $target
    # this returns the pair in list context or a boolean `found` value in
    # scalar context
    return pairfirst { abs( $a - $b ) == $target } ( map { @$_ } @pairs );
}

sub slurp($fh) {
    local $/ = undef;
    my $out = <$fh>;
    return $out;
}
