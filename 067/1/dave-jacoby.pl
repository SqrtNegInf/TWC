#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my ( $m, $n ) = ( 5, 3 );
GetOptions(
    'm=i' => \$m,
    'n=i' => \$n,
);

my $output = number_combos( $m, $n );

say "@$output\n";
exit;

# I use default values in subroutine signaturs
# so that I can call without arguments and get
# the results in the description
sub number_combos ( $m = 5, $n = 2 ) {

    # whenever I find a language where ranges are
    # difficult, I miss Perl's ..
    my @array = 1 .. $m;
    my @output = _number_combos( $n, '', \@array );

    # I *could* just return _number_combos(), but I
    # like being able to output to an array or arrayref
    # depending on what I'm doing. wantarray is your friend.
    return wantarray ? @output : \@output;
}

# I did some testing where $m > 9, and then, you're 
# adding two-digit numbers to the array, which means
# you could have a conceptual two-digit number that's
# really a three-digit number. '9,10' becomes 910, and 
# we're tossing that out
sub _number_combos ( $length, $string, $m_arr ) {
    my @output;
    if ( length $string > $length )  { return }
    if ( length $string == $length ) { return $string }

    # for as many times as we have elements in the array,
    #   we shift the first digit
    #   concatenate it to the string and recall _number_combos
    #   push the output into array
    #   push that first digit onto the end of the array
    # and go again
    for ( 1 .. scalar $m_arr->@* ) {
        my $l = shift $m_arr->@*;
        push @output, _number_combos( $length, $string . $l, $m_arr );
        push $m_arr->@*, $l;
    }
    return wantarray ? @output : \@output;
}
