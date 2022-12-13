#!/usr/bin/env raku

my @templates = ('?5:00', '?3:00', '1?:00', '2?:00', '12:?5','12:5?');

sub GetDigit($tp, $n) {
  print "Input: \$time = \'$tp\'\n";
  print "Output: ";
  if (( $n == 0 ) && (substr($tp,1,1) < '4')) {
    say "2";
  } elsif (( $n == 0 ) && (substr($tp,1,1) >= '4' )) {
    say "1";
  } elsif (($n == 1) && (substr($tp,0,1) <= '1')) {
   say "9";
  } elsif (($n == 1) && (substr($tp,0,1) == '2')) {
   say "3";
  } elsif ($n == 3)  {
   say "5";
  } elsif ($n == 4)  {
   say "9";
  } else {die "Error!"};
  say " ";
}

for @templates -> $tp {
  GetDigit($tp,$tp.index('?'));
}
