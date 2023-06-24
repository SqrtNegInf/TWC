#!/usr/bin/env perl
use v5.36;

my @numbers = split /,/, '1,2,3,4,9,10,14,15,16';
my $last    = shift @numbers;
my @runs    = ( [ $last ] );

while (my $n = shift @numbers)
{
    if ($n == $last + 1)
    {
        push $runs[-1]->@*, $n;
    }
    else
    {
        push @runs, [ $n ];
    }

    $last = $n;
}

my @ranges;

for my $run (@runs)
{
    if (scalar @$run > 2)
    {
        push @ranges, $run->[0] . '-' . $run->[-1];
    }
    else
    {
        push @ranges, join(',', @$run);
    }
}

print "\n", join(',', @ranges), "\n";
