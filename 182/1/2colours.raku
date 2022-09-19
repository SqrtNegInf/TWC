#!/usr/bin/env raku

#my @n <==
#  prompt 'Input: @n = ' andthen
my @n = (1, 2, 4, 2, 4, 1).comb: / \d+ /;
print 'Output: ';
@n andthen
  .first: .max, :k andthen
  .say;
