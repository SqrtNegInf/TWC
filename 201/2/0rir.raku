#!/usr/bin/env raku

use Test;
use Memoize;

constant DEBUG = False;                             #?
sub dsay( **@a --> Bool ) { say "@a[]" if DEBUG;  }

my @Test =  1, 1, 2, 3, 5, 7,
            11, 15, 22, 30, 42, 56, 77,
            101, 135, 176, 231, 297, 385, 490, 627, 792,
            1002, 1255, 1575, 1958, 2436, 3010, 3718,
            4565, 5604, 6842, 8349,
            10143, 12310, 14883, 17977, 21637, 26015, 31185,
            37338, 44583, 53174, 63261, 75175, 89134,
            105558, 124754, 147273, 173525;
;

subset PosInt of Int where * > -1;

# A translation of https://rosettacode.org/wiki/Partition_function_P#Julia

sub p-diff-diff( PosInt $n --> Int) {
    $n %% 2 ?? $n+1 !! ($n + 1) div 2;
}

memoize 'p-diff';
sub p-diff( $n --> Int) {
    $n < 2 ?? 1 !! p-diff( $n-1) + p-diff-diff( $n-1)
}

memoize 'p';
sub p( PosInt $n --> Int ) {

     return 1 if $n < 2;

     my $psum = 0;
     for 1..$n -> $i {
        my $pd = p-diff( $i);
        last if $pd > $n;
        $psum +=  ($i-1)%4 < 2  ??  p($n - $pd)
                                !! -p($n - $pd);
    }
    $psum;
}

for 1..^@Test -> $n {
    is p( $n), @Test[ $n];
}

is p(0), @Test[0];
done-testing;

my $n = 25;
say "\nInput: \$n = $n\n Output: &p($n)";
