#!/usr/bin/env perl
use v5.36;

sub kPermutation{
   my $n=shift;
   our  $k=shift // "all";
   our  @list=(); 
   permute([1..$n], 0, $n-1);
   
   if (ref $k eq "ARRAY"){
	   @list=@list[@$k]
   }
    return @list;
    
# A recursive permutation function.
# takes an array ref, start for swap and end of swap
  sub permute {
    my ($str,$l,$r)=@_;
    my @perm=@$str;          # deref the passed array
    if (($l==$r) and ((ref $k) or ($k eq "all") or (--$k==0))) {
       push @list, [@perm];
      }  # base case, populates the entire list with permutations or just kth one
    else{  
       for my $idx ($l..$r){ 
          ($perm[$l], $perm[$idx])=($perm[$idx], $perm[$l]); # swap
           permute([@perm], $l+1, $r);                        # recurse
          ($perm[$l], $perm[$idx])=($perm[$idx], $perm[$l]); # backtrack
       }  
    }  
  }  
}



  


