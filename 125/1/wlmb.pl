#!/usr/bin/env perl
use v5.36;

use POSIX qw(floor);
use List::Util qw(uniq);

foreach( (5, 13, 60) ){
    my $N=floor($_); # check non-negative integer arguments
    warn("Expected natural"), next unless $N>=0 and $N==$_;
    my @found=();
    foreach my $a(1..$N-1){
	foreach my $b (1..$a-1){
	    push @found, [$a, $b, $_/($a**2-$b**2)] if $_%($a**2-$b**2)==0;
	    push @found, [$a, $b, $_/(2*$a*$b)] if $_%(2*$a*$b)==0;
	    push @found, [$a, $b, $_/($a**2+$b**2)] if $_%($a**2+$b**2)==0;
	}
    }
    say "Input; $_\nOutput:";
    say "\t$_" foreach uniq map { #remove duplicates
	my($A,$B,$K)=@$_; # careful not to confuse with $a and $b from sort
	my ($x, $y, $z)=sort {$a <=> $b} map {$K*$_} ($A**2-$B**2, 2*$A*$B, $A**2+$B**2);
	"\t($x, $y, $z)";
    } @found;
    say("\t-1, no result found") unless @found;
}
