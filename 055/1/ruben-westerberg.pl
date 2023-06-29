#!/usr/bin/env perl
use v5.36;
use experimental 'switch';

srand 1;

use POSIX qw<round>;

my $n=$ARGV[0]//8;
my $number=join "",map { round rand 1 } 1..$n;
say "Testing on: $number";
my $maxSize=-1;
my @max;
for (my $l=0;$l<$n;$l++) {
	for (my $r=$l;$r<$n;$r++) {
		my $str=$number;
		substr($str,$l,$r-$l+1)=~ tr/10/01/;
		given (my @a=$str=~/1/g ) {
			when ($maxSize) {
				push @max, [$l,$r];
			}

			when ($_>$maxSize) {
				@max=([$l,$r]);
				$maxSize=$_;
			}
			default {

			}
		}
		
	}
}
say "Maximal 1's of count $maxSize given by L/R pairs:";
say join ", ", @$_ for @max;

