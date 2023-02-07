#!/usr/bin/env raku

sub COds {my @aray=@_;my %hodf=();my $has3=0;
  print '(' ~ sprintf("%-7s",join(',',@aray)) ~ ') => ';
  for (   @aray) { %hodf{$_}=1 if ($_ % 2); }
  for (0..@aray) {
    if ((%hodf{$_}:exists) && (%hodf{$_+2}:exists) && (%hodf{$_+4}:exists)) { $has3=1;last; } }
  say    $has3 ~ ';';
  return($has3);
}
if    (@*ARGS) {
  COds(@*ARGS);
} else {
  COds(1,5,3,6); # => 1
  COds(2,6,3,5); # => 0
  COds(1,2,3,4); # => 0
  COds(2,3,5,7); # => 1
}
