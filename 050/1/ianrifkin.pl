#!/usr/bin/env perl
use v5.36;

# Assumption: Input numbers, similarlily to example are in order:
#              - the first number in a pair is <= the first number in the next  pair
#              - the second number in a pair is <= the second number in the next pair
# Solution by Ian Rifkin

my @numbers = ( [2,7], [3,9], [10,12], [15,19], [18,22] );

for (my $i=0; $i < scalar @numbers-1; $i++) {
    if ($numbers[$i][1] >= $numbers[$i+1][0] && $numbers[$i][1] <= $numbers[$i+1][1]) {
	$numbers[$i][1] = $numbers[$i+1][1];
	splice(@numbers, $i+1, 1);
	$i--; #loop through to check if new merged interval should also merge with the next one
    }
}

###### Print Output #######
say "\nMerged interval output:";
foreach my $number_pair (@numbers) {
    print "[$$number_pair[0],$$number_pair[1]]";
    print ", "  unless $number_pair == $numbers[-1];
}
print "\n\n";
