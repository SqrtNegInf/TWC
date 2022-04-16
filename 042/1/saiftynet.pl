#!/usr/bin/env perl
# Perl Weekly Challenge 42-1 Script
# Octal Number System Write a script to print decimal number 0 to 50
# in Octal Number System.
# Task extended to allow conversion into any base
# from 2 to 36 (using A-Z), and also converts back from any base 
# back to decimal

use strict; use warnings;

my $base=8;

print "Converting from decimal to octal (base 8)\n";

for my $n (1..50){
  printf ("Decimal %2s is %2s in base %1s\n",$n, decimalTobaseN($base,$n), $base) ; 
}

sub decimalTobaseN{
   my ($base,$number)=@_;                   # Function receives base and the number to convert
   my @digits=(0..9,'A'..'Z');              # potential output characters

   my $string="";                           # holds the output as string of characters
   
   while ($number>0){                       # continue until no more required
      my $remainder=$number % $base;        # get the remainder after division with base
      $string=$digits[$remainder].$string;  # add that to the left most side of string 
      $number=($number-$remainder)/$base;   # divide the residual number by base
   }
   
   return $string                           # return the result
}
