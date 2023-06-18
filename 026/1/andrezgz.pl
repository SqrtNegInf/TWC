#!/usr/bin/env perl
use v5.36;

my ($w1, $w2) = ('chancellor', 'chocolate');

print scalar                        # print the number
      grep {
          $_ =~ /[A-Za-z]/          # of alphabethic case insensitive characters
          && index($w2, $_) != -1   # that exist on the second word
      } split //, $w1;              # from each one of the first word
