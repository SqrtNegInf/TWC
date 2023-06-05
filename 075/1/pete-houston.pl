#!/usr/bin/env perl
use v5.36;

use Algorithm::Knapsack;
use Lingua::EN::Inflexion;

# Construct a big enough set of coins
my $target = 6;
my @coins  = map {($_) x ($target / $_)} <1 2 4>;

# Process
my $sack = Algorithm::Knapsack->new (
	capacity => $target,
	weights  => \@coins,
);
$sack->compute;

# De-duplicate
my %sets;
$sets {join (',', @coins[@$_]) . "\n"} = 1 for $sack->solutions;

# Output
my $ways = keys %sets;
print inflect ("There <#d:$ways><V:is> <#nw:$ways> " .
	"<N:way> of paying $target:\n\n"),
	sort keys %sets;
