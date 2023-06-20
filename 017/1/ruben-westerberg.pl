#!/usr/bin/env perl
use v5.36;

use List::Util qw<min>;

my ($m,$n)=(1,2);

my ($ack,$iter)=acker($m,$n);
print "Ackerman value for (m=$m, n=$n): $ack  in $iter recursions\n";

sub acker {
	my $counter=0; 
	my $iacker;
	$iacker=sub { 	#need to use a sub reference to avoid 'not shared' warning for $counter;
		my ($m,$n)=@_;
		$counter++; 	#Increment the recursion counter for informational purposes.
		print  "Recursion $counter\n";
		my $y;
		if ($m==0) { $y=$n+1 }
		else {
			if ($n==0) {
				$y=&$iacker($m-1,1);
			}
			else {
				$y=&$iacker($m-1,&$iacker($m,$n-1));
			}
		}
		$y;
	};
	(&$iacker(@_), $counter); #Call internal ackerman function.
}
