#!/usr/bin/env perl
use v5.36;

use List::Util qw/ sum /;

my @candidate;

# Allow anything that looks like a list as arguments
(my $argv = "1, 4, 3, 2") =~ s/[,()]/ /g;
@candidate = split(" ", $argv);

die "Usage: $0 list-of-numbers" unless @candidate;


# Make the boundaries easy by adding left and right elements that
# won't add to the total.
unshift @candidate, $candidate[ 0];
push    @candidate, $candidate[-1];

sub candy($left, $me, $right) { return 1 + ($me > $left) + ($me > $right); }

# range of indexes excludes first and last element
my $score = sum map { candy(@candidate[ (($_-1), $_, ($_+1) ) ]) } ( 1 .. ($#candidate-1) );
say "$score";
