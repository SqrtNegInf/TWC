#!/usr/bin/env raku

use Test;

my @Test =
    #  @int            k      exp
    (2, 5, 9, 11, 3),   1,      17,
    (2, 5, 9, 11, 3),   2,      11,
    (2, 5, 9, 11, 3),   0,      2,
    (2, 5, 9, 11, 3),   3,      0,
;

plan @Test ÷ 3;

multi func( $k where * == 0, @a ) { @a[0] }

multi func( $k, @a ) {
    [+] @a[  ^@a .grep( $k == *.base(2).comb.grep('1'))  ]; 
}

for @Test -> @in, $k, $exp {
    is func($k, @in), $exp, "$exp\t<- $k K\t@in[]";
}

done-testing;
my @int = ( 0..25);
my $k = 4;

say "\nInput: @int = @int.raku(), \$k = $k\nOutput: &func($k, @int)";
