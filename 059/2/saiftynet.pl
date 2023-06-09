#!/usr/bin/env perl
use v5.36;

print bitsum(2,3,4);
sub bitsum{
  my @list=@_;
  my $sum=0;                         # accumulator
  foreach my $m (0..@list-2){        # usual 2 fors to get
    foreach my $n ($m+1..$#list){    # all combinations           
     $sum    +=                      # get scalar
            ()=                      # cast intoa array
     (sprintf "%b", $list[$m]^$list[$n])# covert to binary
          =~m/1/g;                   # get matches
    }
  }
  return $sum;
}
