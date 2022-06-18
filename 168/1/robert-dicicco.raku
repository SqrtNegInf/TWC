#!/usr/bin/env raku

my @perrin = (3,0,2);

my @results = ();

my $PRIME_COUNT = 13;

my $i = 0;

while $i <= $PRIME_COUNT  {

  my $slots = @perrin.elems;

  my $calc_val = @perrin[$slots - 2] + @perrin[$slots - 3];

  @perrin.push: $calc_val;

  if $calc_val.is-prime {

    @results.push: $calc_val;

    $i++;

  }

}

@results = @results.sort.unique;

for @results -> $val {

  print "$val ";

}

say ' ';
