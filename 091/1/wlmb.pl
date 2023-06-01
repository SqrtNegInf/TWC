#!/usr/bin/env perl
use v5.36;

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
