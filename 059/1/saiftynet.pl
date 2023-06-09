#!/usr/bin/env perl
use v5.36;

my @l=qw/1 4 3 2 5 2/;

print  join "->",partition(3);

sub partition{

# get the pivot and list
  my ($k,@list)=@_;   

# prepare anonymnous lists containing equal, after and before numbers
  my @seq=([],[],[]); 

# <=> return -1 if less (before), 0 if equal (pivot) and 1 of greater (after);
# use this result as an index to push the numbers into one of these lists
  foreach my $t (@l){
    push @{$seq[$t<=>$k]},$t
  };

# return partitioned data
  return @{$seq[-1]},@{$seq[0]},@{$seq[1]};

}

