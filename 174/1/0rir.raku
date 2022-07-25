#!/usr/bin/env raku

use Test;

# my @d = 1, 2, 3, 4, 5, 6, 7, 8, 9, 89, 135, 175, 518, 598, 1306, 1676, 2427, 2646798, 12157692622039623539;

my constant @disarium = lazy gather do {

    take $_ for 1 … 9, 89, 135, 175;
    for 500 … ∞  -> $n {
        next if $n % 10 < 6;
        my $d = 0;
        my @a = $n.split: '', :skip-empty; 
        for  reverse( 0..@a.end)  {
            $d += @a[$_]**($_+1);
            last if $d > $n; # or 0 == $_;
        }
        take $n if $n == $d;
    }
};

my $t = now;
say "The first 18 disarium numbers are:";
print @disarium[0];
print ", @disarium[$_]" for 1 .. 16;
#say "\nThat took: ", now - $t, ' seconds.';
