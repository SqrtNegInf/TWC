#!/usr/bin/env perl
use v5.36;

use List::Util;
my ($start, $end)=sort {$a > $b } ($ARGV[0]//100, $ARGV[1]//999);

for ($start..$end) {
	my $prev;
	my $val= grep {$_ == 1} map {
		#print "Number: $_\n";
		my @res;
		if (!defined($prev)) {
			@res=();
		}
		else { 
			@res=($_ - $prev);
		}
		$prev=$_;
		@res;
	 } split "",$_;
	 #print $val,"\n";;
	print "Stepping number: $_\n" if $val==length($_) - 1;
	#print "$_:  ",join(", ",@val),"\n";
}
