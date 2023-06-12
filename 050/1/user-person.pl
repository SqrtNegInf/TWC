#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw( minmax );

my $input = "[2,7], [3,9], [10,12], [15,19], [18,22]";

$input = "@ARGV" if @ARGV;

$input =~ s{[][, ]+}{ }g;
$input =~ s{\A\s+|\s+\Z}{};

my @sets = split m{ }, $input;

sub printSets {
    for (my $i=0; $i < $#_; $i += 2) {
        print "[$_[$i], $_[$i+1]]";
        print ", " if $i+1 < $#_;
    }
    print "\n";
}

sub mergeUnits {
    my @indicies = @_;
    my ($min, $max) = minmax ( $sets[$indicies[0]], $sets[$indicies[1]], $sets[$indicies[2]], $sets[$indicies[3]] );
    push @sets, $min;
    push @sets, $max;

    foreach ( sort { $b <=> $a } @indicies ) {
        splice @sets, $_, 1;
    }
}

print "UNMERGED:\n";
printSets @sets;

OUTER:
for (my $j=0; $j < $#sets; $j += 2) {
    for ( my $k=$j+2; $k < $#sets; $k += 2) {

        if ( $sets[$k] >= $sets[$j] and $sets[$k] <= $sets[$j+1]
                     or $sets[$k+1] >= $sets[$j] and $sets[$k+1] <= $sets[$j+1] ) {

            mergeUnits $j, $j+1, $k, $k+1;
            $j = -2;            # This resets OUTER loop to 0 after its double increment
            next OUTER;
        }
    }
}

@sets = sort { $a <=> $b } @sets;
print "\nMERGED:\n";
printSets @sets;
