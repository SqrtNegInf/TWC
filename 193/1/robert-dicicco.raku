#!/usr/bin/env raku

my @arr = (2,3,4);

for (@arr) -> $n {
  say "Input: \$n = $n";
  my $x = 0;
  print "Output: ";
  while True {
    my $str = sprintf <%0*b>, $n,$x;
    if $str.chars > $n {
      last;
    }
    print "$str ";
    $x++;
  }
  say "\n";
  }
