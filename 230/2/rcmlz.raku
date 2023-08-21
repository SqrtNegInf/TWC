#!/usr/bin/env raku
use Test;

sub task2(%input) {
	my $prefix = %input<prefix>;
	%input<words>.grep( / ^ $prefix / ).elems;
}

my @testcases = (
  {input => { words=> ("pay", "attention", "practice", "attend"), prefix=>"xxx"}, output => 0},
  {input => { words=> ("pay", "attention", "practice", "attend"), prefix=>"at"},  output => 2},
  {input => { words=> ("janet", "julia", "java", "javascript"),   prefix=>"ja"},  output => 3},
);

is task2($_<input>), $_<output> for @testcases;
