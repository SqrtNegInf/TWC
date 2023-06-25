#!/usr/bin/env perl
use v5.36.0;

use Algorithm::Permute;

my $maxv = 0;
my @array = ([1,2,3,4,5,6,7], [2,4,1,3], [10,5,7,12,8]);

for (@array) {
    my @a = @$_;
    my @a_jn = join(",",@a);
    print("Input: \@array = (",@a_jn,")\n");
    my $p = Algorithm::Permute->new(\@a, 2);
    while (my @res = $p->next) {
        my $x = $res[0] ^ $res[1];
        if ($x > $maxv) {
            $maxv = $x;
        }
    }
    print("Output: $maxv\n");
    $maxv = 0;
    print("\n");
}
