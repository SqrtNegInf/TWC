#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;
use Algorithm::Permute;

my $max = 0;
my @n = ( [1,2,3,2], [1,3,2], [1,1,2,3], [2,4,3] );
my @res;

foreach  my $ref (@n) {
  my $maxval = 0;
  print("Input: \@n = \[@{$ref}\]\n");
  my $p = Algorithm::Permute->new([@{$ref}], 3);
  while ( @res = $p->next) {
    my $val = join("", @res);
    if ($val > $maxval) {
      $maxval = $val;
    }
  }
  my ($a,$b,$c) = split("",$maxval);
  if (($a+$b > $c) & ($b+$c> $a) & ($a+$c>$b)) {
    print("Output: \[$a, $b, $c\]\n");
  } else {
    print("Output: \[\]\n");
  }
  say " ";
}
