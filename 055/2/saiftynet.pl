#!/usr/bin/env perl
use v5.36;

my @list=(3,1,4,5);

my @results=([[],[@list]]);
while (1){
   my $res=$results[0];
   my @rest=@{$res->[1]};    # extract sequence
   my @seq= @{$res->[0]};    # extract potential next elemenets
   last unless @rest;        # exit loop when no more elements left 
   foreach (1..@rest){       # for each of the potential elements
      my $next=shift @rest; 
      push @results,[[@seq,$next],[@rest]] # add sequence and remnant to result
      if wavy2(@seq,$next) eq "Down first";  # but only if the result is wavy
          push @rest,$next;     # rotate the remnant list
      }
      shift @results;           # rotate the results
}

# print out the sequences found
print "The list ( ".join (", ",@list). " ) can be made to form the following wavy lists: -\n";
foreach my $res (@results){
   print join  (",",@{$$res[0]}),"\n";
}

sub wavy2{
  my @seq=@_;
  my ($evenUp,$evenDown,$oddUp,$oddDown);
  foreach my $i (1..$#seq){
    if ($i%2){                      # phases are even or odd, up going or down going
       $evenUp=1   if ($seq[$i]>$seq[$i-1]);
       $evenDown=1 if ($seq[$i]<$seq[$i-1]);
    }
    else{
       $oddUp=1   if ($seq[$i]>$seq[$i-1]);
       $oddDown=1 if ($seq[$i]<$seq[$i-1]);
    }
    # wavy phases have the even pahases only going one way and the odd phases
    # in the opposite direction
    return "Not wavy" if ($evenUp   and $evenDown) ||
                         ($oddUp    and $oddDown)  ||
                         ($evenUp   and $oddUp)    ||
                         ($evenDown and $oddDown);
  }
  return $evenUp?"Up first":"Down first";  # returns "Up first", "Down first" or "Not wavy"
}


