#!/usr/bin/env perl
use v5.36;

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
