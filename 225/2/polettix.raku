#!/usr/bin/env raku

sub MAIN (@inputs = (10, 4, 8, 3) ) { say left-right-sum-diff(@inputs) }

sub left-right-sum-diff (@inputs) {
   my $sum = 0;
   my @retval;
   for ^@inputs -> $i {
      @retval.push: $sum;
      $sum += @inputs[$i];
   }
   for ^@inputs -> $i {
      $sum -= @inputs[$i];
      @retval[$i] = abs(@retval[$i] - $sum);
   }
   return @retval;
}
