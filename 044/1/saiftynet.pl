#!/usr/bin/env perl
use v5.36;

tryInsert("123456789",100); # main call: provide intial string and target.

# This subroutine splits a string into two at each possible position
# in the string, and tries a calulation with a + or a - in beteen.
# It then does the same with the second half of the string.
# at each insert it evaluates the result, and prints the string
# as a possible solution;  All discovered answers are displayed.

sub tryInsert{
	my ($str,$target,$marker)=@_;
	$marker //=1;	      # $marker identifies the first insertion point
	                      # further attempts ar from this point to the
	                      # postion before the last character in the string 
	foreach my $pos ($marker..((length $str)-1)){
		foreach my $operator(qw{+ -}){
		  my $temp=$str;                      # put in a temporary string
		  substr $temp,$pos,0,$operator;      # insert the operator
		  print $temp."\n"                    # print the reulting string
		     if   eval ("$temp")==$target;    # only if the result is our $target 
		  tryInsert($temp,$target,$pos+2);    # recurse with new insertion point 
	    }
	}
}
