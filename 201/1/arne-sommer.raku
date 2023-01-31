#!/usr/bin/env raku

unit sub MAIN (@array where @array.elems && all(@array) ~~ /^<[0..9]>*$/= (0, 1, 3, 5, 9, 10) );

my $n       = @array.elems;
my @sorted  = @array.sort;
my @missing = ();
my $current = @sorted.shift;

for 0 .. $n -> $i
{

  $current == $i
    ?? ( $current = @sorted.shift || next )
    !! ( @missing.push: $i                );
}

say @missing.join(",");

