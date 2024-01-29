#!/usr/bin/env perl
use strict;
use warnings;

sub split_strings{
  my ($arr,$sep) = @_;
  grep {length} map{split /\Q$sep\E/} @$arr
}

print split_strings(['one.two.three','four.five','six'],'.');
print split_strings(['$perl$$', '$$raku$'],'$');

