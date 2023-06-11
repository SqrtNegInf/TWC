#!/usr/bin/env perl
use v5.36;

use List::Util qw/max/;

sub collatz
{
    my $n = shift;
    my @r = $n;
    while ($n > 1) {
        $n = ($n % 2) ? ($n * 3 + 1) : (int($n / 2));
        push @r, $n;
    }
    return \@r;
}

#--------------------------------------------
my @n = @ARGV ? @ARGV : 1..10000;

my %res;
for my $i (@n) {
    my $c = collatz($i);
    $res{$i} = {
        num => scalar @$c,
        max => max(@$c),
    };
}

my @ores = sort { $res{$b}->{num} <=> $res{$a}->{num} } keys %res;
my $e = $#ores;

my $j;
for my $i (@ores[0..(5, $e)[5 > $e]]) {
    printf "%2d %6d length: %6d max: %12d\n", ++$j, $i, $res{$i}->{num}, $res{$i}->{max};
}

exit 0;
