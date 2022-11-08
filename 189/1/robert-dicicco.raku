#!/usr/bin/env raku

my @arr =  (["e", "m", "u", "g"], ["d", "c", "e", "f"], ["j","a","r"], ["d", "c", "a", "f"], ["t", "g", "a", "l"]) ;
my @target = qw[b a o a v ];

sub TestValues( $a, $tv ) {
  my $x;
  print "Input: \@array = qw\(@$a\), target = $tv\n";
  my @out = ();
  loop ($x = 0; $x < @$a.elems; $x++) {
    if (@$a[$x] gt $tv)  {
      push(@out, @$a[$x]);
    }
  }
  @out.elems > 0 ?? say @out.sort[0] !! say $tv;
  say " ";
}

sub main {
  my $cnt = 0;
  for (@arr) -> $p {
    TestValues($p,@target[$cnt++]);
  }
}

main();
