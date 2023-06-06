#!/usr/bin/env perl
use v5.36;

my @A = @ARGV;
@A = (1, 2, 2, 3, 3, 4, 2, 2, 2) if scalar @A == 0;
say "input: @A";

my %count;
$count{$_}++ for @A;

# version 1:
# is first elem count larger than half list size?
my $max = ( sort { $count{$b} <=> $count{$a} } keys %count )[0];
say "ver 1: ", $count{$max} > int(@A/2) ? $max : -1;

## version 2:
## if first elem same at far side of center?
my @sorted = sort {$count{$b} <=> $count{$a}} @A;
say "ver 2: ", $sorted[0] eq $sorted[int(@A/2)] ? $sorted[0] : -1;

## version 3:
## is maximum count greater than the sum for all other values?
use List::Util qw(sum);
my ($candidate, $count) = ($sorted[0], $count{$sorted[0]});
delete $count{$sorted[0]};
my $others = sum values %count;
say "ver 3: ", $count > $others ? $candidate : -1;
