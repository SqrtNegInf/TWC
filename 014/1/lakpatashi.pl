#!/usr/bin/env perl
use v5.36;
use feature qw(switch);

use List::Util qw(sum);

#part 1
my $max = 100;
my @seq = (0)x$max;
vanEckSeq();	# building pre compiled seq

print "@seq[0..20]\n";
sub vanEckSeq{
	for my $i (0..$max-1){
		for my $j (reverse 0..$i-1){
			if($seq[$j] == $seq[$i]){
				$seq[$i+1] = $i-$j;
				last;
			}	
		}
	}
}
