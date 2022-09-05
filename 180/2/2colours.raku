#!/usr/bin/env raku

my @n = (1,9,0,6,2,3,8,5,104,) andthen #<== prompt 'Input: @n = ' andthen
  .comb: /\d+/;
my $i = 5; #prompt 'Input $i = ';
print 'Output: ';
@n
  .grep: * > $i andthen
  .join: ',' andthen
  say "($_)";
