#!/usr/bin/env perl
use v5.36;

use List::Util qw(max min);

 INPUT: for('199100199'){
     say("String should contain digits only: $_"), next INPUT unless /^\d+$/;
     my $length=length;
     FIRST: for my $length1(1..$length/2){ # no need to consider larger first numbers
	 my $copy=$_; # make a copy of input string
	 my $previous=substr $copy, 0, $length1, ""; # choose the starting number
	 for my $length2(1..$length/2){
	     # ignore numbers that are too large:
	     next FIRST if 2*max($length1,$length2) > $length - min($length1, $length2);
	     my $copy_of_copy=$copy;
	     my $current=substr $copy_of_copy, 0, $length2, "";
	     my $next=$previous + $current;
	     while($copy_of_copy=~s/^$next//){ # found next number in sequence?
		 say("$_ -> True"), next INPUT if length $copy_of_copy==0; # Finished?
		 ($current, $next)=($next, $current+$next)
	     }
	 }
     }
     say "$_ -> False";
}
