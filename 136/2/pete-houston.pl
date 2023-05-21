#!/usr/bin/env perl
use v5.36;

use Algorithm::Knapsack;
use Params::Util '_POSINT';
use List::Util 'sum';

# Validate input
my $tot = 1234; #shift;
die "Argument must be a whole number.\n" unless _POSINT $tot;

# Construct a big enough Fibonacci sequence. No duplicates!
my @fib = (1, 2);
push @fib, $fib[-1] + $fib[-2] while $fib[-1] + $fib[-2] <= $tot;

# Process
my $sack = Algorithm::Knapsack->new (
	capacity => $tot,
	weights  => \@fib,
);
$sack->compute;

my $combos = grep { sum (@fib[@$_]) == $tot } $sack->solutions;

# Output
print "$combos\n";
