#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);
use POSIX q(floor);

my @A = (1, 2, 2, 3, 2, 4, 2);

# Create a list with some random numbers if none provided
@A = map {int(rand(3))} (1 .. 3 + rand(5))
  if (!scalar @A);

my $N = scalar(@A);
my %ME = ();
my $reason;
my $me;

$ME{$_}++ foreach (@A);
my $max = max(values %ME);
my @max = grep { $_ if $ME{$_} == $max } keys %ME;

if (scalar @max ==  1 and
    $max > floor($N/2)) {
  ($me, $reason) = ($max[0],
                    sprintf('as %d appears %d times in list which is more than floor(%d/2).',
                             $max[0], $max, $N));
} else {
  ($me, $reason) = (-1,
                    sprintf('as none of the elements appears more than floor(%d/2).',
                            $N));
}

printf "Input: \@A = (%s)\n", join(', ', @A);
printf "Output: %d %s\n", $me, $reason;

