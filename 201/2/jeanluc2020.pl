#!/usr/bin/env perl
use v5.36.0;

my @examples = (1, 2, 3, 4, 5, 10);

foreach my $example (@examples) {
   my @solutions = find_solutions($example);
   say scalar(@solutions) . " solutions found:";
   foreach my $solution (@solutions) {
      say join(" ", @$solution);
   }
}

# our recursive function
sub find_solutions {
   my ($n, $max_pile_size) = @_;
   # if no maximum pile size was given use $n as fallback
   $max_pile_size //= $n;
   # limit $max_pile_size to $n
   $max_pile_size = $n if $max_pile_size > $n;
   my @solutions;
   # There is only an empty solution if $n is 0
   return ([]) unless $n > 0;
   # now create the last pile
   foreach my $last (1..$max_pile_size) {
      # create all piles left to the last one
      my @sub_solutions = find_solutions($n - $last, $last);
      # add the last pile to each of these solutions and add
      # the solutions to our return array
      foreach my $sub_solution (@sub_solutions) {
         push @$sub_solution, $last;
         push @solutions, $sub_solution;
      }
   }
   return @solutions;
}
