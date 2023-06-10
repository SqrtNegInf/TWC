#!/usr/bin/env perl
use v5.36;

my @N = (2, 7, 9);  # the tasks expects list to be sorted, handy.
my $k=2;            

diff_k($k,@N);

sub diff_k{
  my ($k,@list)=@_;   # list may be passed as a list or ArrayRef
  @list=@{$list[0]}if (scalar @list==1); 
  for my $i(1..$#list){      # i is any number 1 to end index
      for my $j  (0..$i-1){  # j is smaller than i
        print $i,",",$j,"\n" if ($list[$i]-$list[$j])==$k;
      }
  }
}

