#!/usr/bin/env perl
use v5.36;

use Test::More;

my $tests = [ 
   [ [10,10],[20,15],[30,20],[40,25] ],
   [ [1,1],[3,2],[5,3],[7,4] ],
];

my @as = map {averageStream->new} (1 .. scalar @$tests);

for (my $i = 0; $i < scalar @$tests; $i++) {
  foreach my $t1 (@{$tests->[$i]}) {
    printf "%d %s\n", $i, join(',', @$t1) unless is($as[$i]->add($t1->[0]),$t1->[1]);
  }
}

done_testing();


package averageStream;

sub new {
  my %this = (sum => 0, count => 0, average => undef);

  bless \%this;
}

sub add {
  my ($this,$n) = @_;

  $this->{sum} += $n;
  $this->{average} = $this->{sum} / ++$this->{count};

  $this->{average};
}

sub average {
  $_->{average} // die "No points added yet!";
}
