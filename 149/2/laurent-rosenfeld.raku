#!/usr/bin/env raku

my @res;

sub largest ($base) {
    my $largest_num = $base ** $base - 1;
    my $largest_root = $largest_num.sqrt.Int;
    for (1..$largest_root).reverse -> $i {
        my $sq = $i².base($base);
        next if $sq.chars != $sq.comb.Set;
        @res.push: "f($base) = $sq" and last;
    }
}
for 1..8 -> $test { largest $test }

say my $result = @res.join("\n");

my $ref = q:to/END/;
f(2) = 1
f(3) = 1
f(4) = 3201
f(5) = 4301
f(6) = 452013
f(7) = 6250341
f(8) = 47302651
END

use Test;
is $result, chomp $ref;
