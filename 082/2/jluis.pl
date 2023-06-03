#!/usr/bin/env perl
use v5.36;

my ($A,$B,$C) = ('XXY', 'XXZ', 'XXXXZY');

say 0 and exit if length $C != length qq($A$B);

my %source =(A=>$A,B=>$B);



my $pos = 0;
my $bases = q{};

while ( length $bases  < length $C)  {
	my $check =  length $bases;
	for my $choice (qw(A B)) {
	    if ( length $source{$choice}) {
	     	if ( (substr $source{$choice},0,1 ) eq substr $C,length $bases ,1 )  {
		    $bases .= $choice;
		    (substr $source{$choice},0,1 ) = q{};
		    last;
		}
	    }

        }
	last if $check == length $bases

}

say  0 + (length $bases == length $C) ;  
