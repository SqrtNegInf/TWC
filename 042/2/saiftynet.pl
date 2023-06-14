#!/usr/bin/env perl
use v5.36;

srand 1;

for (1..10){
	my $testString=randomString();          # generate random string
	printf ("  %-12s", $testString);        # display it
	print  findError($testString),  "\n";   # validate it
}

sub randomString{                           
	my $string="";                          # start with empty string
	for (0..(rand()*5+1)){                  # for a random length (2 - 7)        
		$string.=("(",")")[rand()*2];       # keep adding a random bracket
	}
	$string;                                # return the string
}

sub findError{
	my $str=shift;
	while ($str =~s/\((-*)\)/-$1-/){};      # keep replacing matched braces with
	                                        # hyphens. What is left are string
	                                        # contaning unmatched brackets
	                                        # If these exist, they show locations
	                                        # of errors
	if ($str=~/\(|\)/){ return "Not ok unmatched brackets at $str "};
	"OK, Balanced brackets";
	
}
