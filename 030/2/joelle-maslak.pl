#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

# Read this next portion of code from bottom up.
say join "\n",    # Build a string, seperating sets by newlines
  map { join( ",", $_->@* ) }    # Make the sets into comma-deliminated strings
  grep { sum( $_->@* ) == 12 }   # Make sure these numbers sum to 12
  grep { $_->[1] < $_->[2] }     # Make sure last number is the biggest
  grep { $_->[0] < $_->[1] }     # Make sure 2nd number is bigger than 1st
  cross( [ 1 .. 7 ], [ 2 .. 8 ], [ 3 .. 9 ] );    # Create a list where each element is a list
                                                  # of 3 numbers.

# Cross product of multiple lists
# Takes multiple (2+) list references. Returns a list of list
# references.
sub cross(@lists) {
    confess("Invalid call") if scalar(@lists) == 0;

    my sub recursive_cross ( $output, @lists ) {
        return $output->@* if scalar(@lists) == 0;

        my (@addlist) = ( shift @lists )->@*;

        # A lexical sub in a lexical sub? Why not.
        my sub append(@l) {
            return map { [ @l, $_ ] } @addlist;
        }

        # Note the map on the next line uses the expression form...
        my (@result) = map append( $_->@* ), $output->@*;

        return __SUB__->( \@result, @lists );
    }

    my (@output) = map { [$_] } ( shift @lists )->@*;
    return recursive_cross( \@output, @lists );
}

