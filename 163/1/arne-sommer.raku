#!/usr/bin/env raku

# result differs from others

my @n = ( 1, 2, 3, 8+2 );
my $verbose = False;

if $verbose
{
  say ": Combinations: { @n.combinations(2).map({ "(" ~ $_[0] ~ "," ~ $_[1] ~ ")" } ) }";
  say ": Mapped to:    { @n.combinations(2).map({ $_[0] ~& $_[1]} ) }";
}

say @n.combinations(2).map({ $_[0] ~& $_[1]} ).sum;
