#!/usr/bin/env perl
use v5.36;

my $DEBUG = 0;
my $COINS = $ARGV[0] || "1, 2, 4";
my $SUM   = $ARGV[1] || 6;

print "Possible ways to achieve the target: ",
      coins_sum(prepare($COINS), $SUM), "\n";

#
#
# METHODS

sub coins_sum {
    my ($coins, $sum) = @_;

    my $size = $#$coins;
    return 0 if ($size == -1 || $sum <= 0);

    my $matrix;

    # Sum of 0 can be achieved in one possible way.
    $matrix->[$_][0] = 1 for (0 .. $size);

    foreach my $i (0 .. $size) {

        foreach my $j (1 .. $sum) {

            my $include_current = 0;
            my $exclude_current = 0;

            if ($coins->[$i] <= $j) {
                $include_current = $matrix->[$i][$j - $coins->[$i]];
            }

            if ($i > 0) {
                $exclude_current = $matrix->[$i - 1][$j];
            }

            $matrix->[$i][$j] = $include_current + $exclude_current;
        }
    }

    show_matrix($matrix) if $DEBUG;
    return $matrix->[$size][$sum];
}

sub show_matrix {
    my ($matrix) = @_;

    my $rows = @$matrix;
    my $cols = @{$matrix->[0]};

    foreach my $r (0 .. $rows-1) {
        foreach my $c (0 .. $cols-1) {
            print sprintf("%s ", $matrix->[$r][$c]);
        }
        print "\n";
    }
}

sub prepare {
    my ($coins) = @_;

    if (defined $coins) {
        $coins =~ s/\s//g;
        return [ split /\,/, $coins ];
    }
}
