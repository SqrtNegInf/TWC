#!/usr/bin/env perl
# Perl weekly challenge 091
# Task 1: Count Number
# Simple RLE encoding of a sequence of digits.
# See https://wlmb.github.io/2020/12/14/PWC91/#task-1-count-number
use warnings;
use strict;
use v5.10;
use List::Util qw(all);
use Scalar::Util::Numeric qw(isint);

for my $N(map {int $_} 1122234){
    print "Input:\t$N\nOutput:\t";
    my $current_digit=""; # Initialize to something printable
    my $current_count="";
    foreach(split(//, $N), "I'm not a digit"){ # digits and a unique stop marker
	if($current_digit ne $_  || $current_count eq 9){ # string comparisons
	    print "$current_count$current_digit";
	    $current_count=0;
	    $current_digit=$_;
	}
	++$current_count;
    }
    say "\n";
}
