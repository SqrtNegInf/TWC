#!/usr/bin/env raku

srand 1;

use Test;

my @Test =   5, [-2..2],
            11, [-5..5],
            21, [-10..10],
;
my @Die = 500, -6,  0;

plan +@Test + @Die;

my $range = 100_000;

sub func( $n, Int $abs-range = $range) {
    die "Domain error" if $abs-range × 2 + 1 < $n;
    die "Invalid index" if $n < 1;
    my @a = ( -$abs-range..$abs-range).pick( $n-1).Array; ;
    @a.push: 0 - @a.sum;
    @a
}

for @Test -> $n, @exp {
    my @return = func( $n, ($n div 2));
    is +@return, $n, "Array size";
    is @return.sort.Array, @exp, "Array values";
}
for @Die -> $n {
    my $range = 10;
    dies-ok { func $n, $range }, 
        "$n is invalid (\$range is -$range..$range)";
}
done-testing;

my $n = 99;
say "\nInput: \$n = $n\nOutput: ", func( $n );

