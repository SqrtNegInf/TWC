#!/usr/bin/env raku

sub all-substrings(Str $in) {
  #gather for (^($in.chars - 1)).hyper -> $i {
  gather for (^($in.chars - 1)) -> $i {
    #for (1..^$in.chars).hyper -> $j {
    for (1..^$in.chars) -> $j {
      take $in.substr($i..$j) if $i <= $j;
    }
  }
}

sub MAIN(@strings is copy = <zabc xabcy abcd>) {
  my @subs = all-substrings(@strings[0]).sort(- *.chars).unique;

  #for @strings[1..*].hyper -> $B {
  for @strings[1..*] -> $B {
    @subs .= grep: -> $A {
      $A.chars <= $B.chars && (0..($B.chars - $A.chars)).grep: -> $i {
	$B.substr-eq($A, $i)
      }
    }
  };

  say @subs.first;
}
