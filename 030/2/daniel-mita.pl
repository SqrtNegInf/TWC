#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

for my $i ( 1..10 ) {
  for my $j ( 1..10 ) {
    for my $k ( 1..10 ) {
      my @group = ( $i, $j, $k );
      say join '|', map { sprintf '%2u', $_ } @group
        if sum(@group) == 12;
    }
  }
}
