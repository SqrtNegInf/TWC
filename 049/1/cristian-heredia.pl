#!/usr/bin/env perl
use v5.36;

#For given number 55, the smallest multiple is 110 consisting of digits 0 and 1.
my $number = 55;
my $result;
my $multiple = 2;

smallestMultiple();

sub smallestMultiple {
    $result = $number * $multiple;
    checkValues();
}

sub checkValues {
   if ( $result =~ /^[01]+$/ ) {
		$number=~ s/^\s+|\s+$//g; 
		print "The smallest multiple is $result\n$number * $multiple = $result\n";
   }
   else {
       $multiple++;
       smallestMultiple();
   }
}
