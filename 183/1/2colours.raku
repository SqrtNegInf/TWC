#!/usr/bin/env raku

BEGIN die 'not ok - disabled: JVM cannot handle "Uni"' if $*VM ~~ /jvm/;

BEGIN die 'not ok - disabled: does not work with 2022.12';

#use immutable; # 2022-12-18 cannot be installed until ecosystem updates are made
use JSON::Fast;

#my $input = prompt '@list = ';
my $input = '([1,2], [3,4], [5,6], [1,2])';
when not $input.&{ .starts-with('(') && .ends-with(')')} {
  say 'Please provide a valid list of arrays.'
}
$input .= subst: '(', '[', :1nth;
$input .= subst: ')', ']', :nth(*);
my \try-list = try $input.&from-json;
when not try-list.defined {
  say 'The elements of the list should be valid according to JSON.';
}
when try-list.are !~~ Array {
  say 'The elements should all be arrays.';
}
my @output-arrays <==
  try-list
  .map: &immutable andthen
  .unique
  .map: *.&to-json(:!pretty);
say "(@output-arrays.join(', '))";
