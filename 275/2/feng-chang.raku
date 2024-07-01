#!/usr/bin/env raku

#unit sub MAIN(Str:D $s);
my $s = <a1c1e1 abcdef>;

my $c;
for $s.comb {
    when 0..9 { print ($c.ord + $_).chr }
    default   { $c = $_; .print         }
}
put '';
