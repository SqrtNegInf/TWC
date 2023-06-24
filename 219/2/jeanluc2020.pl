#!/usr/bin/env perl
use v5.36;

travel_expenditure( [2, 7, 25], [1, 5, 6, 7, 9, 15] );
travel_expenditure( [2, 7, 25], [1, 2, 3, 5, 7, 10, 11, 12, 14, 20, 30, 31] );

sub travel_expenditure {
   my ($costs, $days) = @_;
   print "Input: \@costs = (" . join(", ", @$costs) . ")\n";
   print "       \@days  = (" . join(", ", @$days) . ")\n";
   my $tc = {
      1 => $costs->[0],
      7 => $costs->[1],
      30 => $costs->[2],
   };
   print "Output: " . calculate( $tc, $days) . "\n";
}

sub calculate {
   my ($tc, $days) = @_;
   return 0 unless @$days;
   my $first = $days->[0];
   my $minimum;
   foreach my $tc_days ( keys %$tc ) {
      my $last = $first + $tc_days;
      my $cost = $tc->{$tc_days};
      my @tmp;
      foreach my $day (@$days) {
         push @tmp, $day if $day >= $last;
      }
      $cost += calculate($tc, \@tmp);
      $minimum //= $cost;
      $minimum = $cost if $cost < $minimum;
   }
   return $minimum;
}
