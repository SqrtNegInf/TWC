#!/usr/bin/env raku

#unit sub MAIN(*@ints);
my @ints = (3, 5, 3, 6, 1, 12);

my $start = @ints.pop;
$start *= 2 while @ints.grep($start);
put $start;
