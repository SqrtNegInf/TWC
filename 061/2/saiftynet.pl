#!/usr/bin/env perl
use v5.36;

ip4Partition($_) foreach (qw/25525511135 8888 127001 192168021/);

# subroutine works by partitioning trying all possible partitioning
# trying each possible positions for each of the three dots
# rejecting whenever partioning produces an invalid octet   

sub ip4Partition{
  my $input=shift;
  my $l=length $input;
  print "\nInput: $input yields the followng valid IP4 addresses:-\n";
  
  foreach my $firstDot(1..$l-3){                 # first dot     
    next      unless validOctet(substr($input,0,$firstDot)); 
      
    foreach my $secondDot($firstDot+1..$l-2){    # second dot   
      next    unless validOctet(substr($input,$firstDot,$secondDot-$firstDot));
      
      foreach my $thirdDot($secondDot+1..$l-1){  # third dot
         next unless (validOctet(substr($input,$secondDot,$thirdDot-$secondDot))
                  and validOctet(substr($input,$thirdDot, $l-$thirdDot)));
   
   # print the partitioned IP4 address                  
   print substr($input,0         ,$firstDot),            ".",
         substr($input,$firstDot ,$secondDot-$firstDot), ".",
         substr($input,$secondDot,$thirdDot-$secondDot), ".",
         substr($input,$thirdDot ,$l-$thirdDot),         " \n" ;}
    }
  }
  
  # validating an octet checks that the string is numeric, is less than 255
  # while it may be zero, does not otherwise have leading zeros
  sub validOctet{
    my $str=shift;
    return ($str=~/[\d]+/ and $str<=255 and $str!~/^0[\d]/)?1:0
    
  }
}

