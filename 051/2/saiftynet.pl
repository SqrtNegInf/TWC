#!/usr/bin/env perl
use v5.36;

# for all 3 digit colourful numbers...
print "3 digit colourful numbers \n";
foreach(100..999){  #all possible three digit numbers
  my ($d1,$d2, $d3)=split //, $_;
  my %l=(); # uniqueness is checked by making keys of a hash
            # all the possible consecutive products
  @l{$d1, $d2, $d3, $d1*$d2,$d2*$d3,$d1*$d2*$d3}=1x6;
  
  # if number of keys is 6, then no duplicates exist
  print  "$d1$d2$d3 " if 6 == keys %l; 
}

print "\n\n";

# clearly no colourful number can contain 1 or 0,
# and no duplicate digits can exist, but testing for 
# these exclusion just makes the code more messy

# testing a more generic test for colourfulness
# (i.e not restricted to 3 digits...). Here we test
# for all such numbers between 22000 and 24000
print "Colourful numbers between 22000 and  24000 \n";
foreach(22000..24000){
 print "$_ " if testColourful($_);
}


#  the following  will test any number for colourfulness 
sub testColourful{
   my %products=();
   my @digits=split //, shift;
   # get all possible combinations of consecutive products
   # with each possible start point keep multiplying next digits,
   # storing the result as a key in %products
   foreach my $startDigit (0..$#digits){
        my $p=1;
        foreach (0..$#digits-$startDigit){
           $p*=$digits[$startDigit+$_];
           $products{$p}++;
        }
   }
   # there are n(n+1)/2 possible consecutive digits
   # return if the number of combination matches number of products 
   return keys %products==@digits*(@digits+1)/2;
}
