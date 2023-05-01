#!/usr/bin/env raku

sub MAIN (@scores = (2,5,2,1,7,5,1)) { say rank-score(@scores) }

sub rank-score (@scores) {
   state @lower = <X G S B>;
   my @retval = 0 xx @scores;
   my $n = 0;
   my @pairs = (@scores Z (0 ... *)).sort({ $^a[0] <=> $^b[0] }).reverse;
   for ^@pairs -> $i {
      my ($v, $k) = @pairs[$i].Slip;
      $n = $i + 1 if $i == 0 || @pairs[$i - 1][0] > $v;
      @retval[$k] = $n < 4 ?? @lower[$n] !! $n;
   }
   return @retval;
}
