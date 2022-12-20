#!/usr/bin/env raku

sub CheckUniqDigits($n) {
  my %h1 = ();
  my @arr = $n.comb;
  for (@arr) -> $val {
    %h1.EXISTS-KEY($val) ?? return 0 !! %h1{$val}++;
  }
  return 1;
}

for <15 35 1000> -> $input {
  my $output = 0;
  print "Input: \$n = $input\n";
  for 1..$input -> $i {
    $output += CheckUniqDigits($i);
  }
  print "Output: $output\n\n";
}
