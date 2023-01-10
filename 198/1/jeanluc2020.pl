#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use List::Util qw(max);

# some examples of lists
my $lists = [
   [ 2, 5, 8, 1 ],
   [ 3 ],
   [ 1, 2, 3, 5, 7, 9, 13, 17],
   [ 1, 3, 7, 4, 9, 11 ]
];

# let's generate the output for all examples
foreach my $list ( @$lists ) {
   say "(" . join(", ", @$list) . ") returns " . max_gap(@$list);
}

# let's calculate the gaps
sub max_gap {
   my @list = sort { $a <=> $b } @_;
   my $gaps;
   # if the list contains less than 2 elements then return 0
   return 0 if scalar(@list) < 2;
   my $last = undef;
   foreach my $elem (@list) {
      if(defined($last)) {
         # we're at least at the second element, so let's calculate the gap
         # to the previous element and count this instance
         $gaps->{ $elem - $last }++;
      }
      $last = $elem;
   }
   # return the number of instances for the max gap
   return $gaps->{ max(keys %$gaps) };
}
