#!/usr/bin/env perl
use v5.36;
no warnings 'experimental';

my @L = (-25, -10, -7, -3, -3, 2, 4, 8, 10, -7);
my $T=0;

findTriplet($T,@L);                 # function called with target and list
 
sub findTriplet{
  my ($target,@list)=@_; 
  @list=sort{$a<=>$b} @list;         # the list may not be sorted, so sort first
  my @found=();                      # initialise list triplets found
  foreach my $i(0..$#list-2){        # first number cannot be the last two numbers in the list
    foreach my $j($i+1..$#list-1) {  # second number bigger than first but can not be last number
      foreach my $k($j+1..$#list){   # third number bigger than second in list
		  
		                             # check for triplet and if found add triplet to @found
      unshift @found,[$list[$i],$list[$j],$list[$k]]
                if $list[$i]+$list[$j]+$list[$k]==$target;
      
      # dump duplicates using smartmatch (only check if 2 or more triplets found)
      shift @found if (@found>=2 and @{$found[0]}~~@{$found[1]});
      }
    }
  };
  if (@found){
    print  scalar @found," Triplets found\n";
    foreach my $triple(@found){
      print "[ $$triple[0], $$triple[1], $$triple[2] ] "
    }
  }  
  else{ 
    print  "No Triplet found that add to $target\n"
  };
}

