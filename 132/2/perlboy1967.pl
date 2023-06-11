#!/usr/bin/env perl
use v5.36;

use Test::More;
use Test::Deep;

sub hashJoin :prototype(\@\@);

my  @player_ages = (
  [20, "Alex"  ],
  [28, "Joe"   ],
  [38, "Mike"  ],
  [18, "Alex"  ],
  [25, "David" ],
  [18, "Simon" ],
);

my @player_names = (
  ["Alex", "Stewart"],
  ["Joe",  "Root"   ],
  ["Mike", "Gatting"],
  ["Joe",  "Blog"   ],
  ["Alex", "Jones"  ],
  ["Simon","Duane"  ],
);


is_deeply(
  hashJoin(@player_ages, @player_names), 
  [
    [ 20, "Alex", "Stewart" ],
    [ 18, "Alex", "Stewart" ],
    [ 28, "Joe", "Root" ],
    [ 38, "Mike", "Gatting" ],
    [ 28, "Joe", "Blog" ],
    [ 20, "Alex", "Jones" ],
    [ 18, "Alex", "Jones" ],
    [ 18, "Simon","Duane" ],
  ]
);
 
done_testing;

sub hashJoin :prototype(\@\@) {
  return 
    [map { my $r = $_; map { [$_->[0], @$r] } grep { $_->[1] eq $r->[0] } @{$_[0]} } @{$_[1]}];
}
