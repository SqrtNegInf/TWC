#!/usr/bin/env perl

use strict;
use warnings;

my @l=(2,6,1,3);
#  @l=(19,11,9,7,20,3,17,16,2,14,1); # can't handle this?

print join(' ',noble(@l)),"\n";

sub noble {
  my @l=sort @_;
  my @r;
  foreach my $m (0..$#l) {
    if ($l[$m] == $#l-$m) {
      push @r,$l[$m];
    }
  }
  return @r;
}
