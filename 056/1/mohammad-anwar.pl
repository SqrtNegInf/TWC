#!/usr/bin/env perl
use v5.36;

srand 1;
use List::Util 1.54 qw(sample);

my $K = 5;

my $S = 10;
my @L = sort { $b <=> $a } sample ($S, (1 .. 50));

print sprintf("\@L: [%s]\n", join(", ", @L));
my $matched = find_match($K, @L);

(@$matched)
?
(print join("\n", @$matched), "\n")
:
(print "Oops, none matched.\n");

sub find_match {
    my ($K, @L) = @_;

    my $S = scalar(@L);
    my $matched = [];
    foreach my $i (0 .. --$S) {
        foreach my $j ($i+1 .. $S) {
            my $k = $L[$i] - $L[$j];
            if ($k == $K) {
                push @$matched, sprintf("%2s,%2s => (%2s - %2s) => %d", $i, $j, $L[$i], $L[$j], $k);
            }
        }
    }

    return $matched;
}
