#!/usr/bin/env raku

sub Mono {my @nums=@_;my $frsf=0;my $monf=1;my $strt=1;
  $strt++ while (@nums && $strt < @nums.elems-1 && @nums[$strt-1] == @nums[$strt]);
  if  (@nums.elems > 1) { $frsf= (@nums[$strt-1] > @nums[$strt]) ?? -1 !! 1; }
  for ($strt..@nums.elems-2) {
    if (($frsf == -1 && @nums[$_] < @nums[$_+1]) ||
        ($frsf ==  1 && @nums[$_] > @nums[$_+1])) { $monf=0;last; } }
  print '(' ~ sprintf("%-7s",join(',',@nums)) ~ ') => ';
  say    $monf ~ ';';
  return($monf);
}
if    (@*ARGS) {
  Mono(@*ARGS);
} else {
  Mono(1,2,2,3); # => 1
  Mono(1,3,2  ); # => 0
  Mono(6,5,5,4); # => 1
}
