#!/usr/bin/env raku

die 'Does not compute';

#my $s = prompt 'Input: $s = ';
my $s = 'Raku Yearly Challenge';
my @letters = $s.comb;
#print 'Output: ';
@letters
  .kv
  .map: { last $^key if @letters.Bag{$^letter} == 1 } andthen
  .first
  .say;
