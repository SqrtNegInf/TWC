#!/usr/bin/env raku

my $maxv = 0;
my @array = ([1,2,3,4,5,6,7], [2,4,1,3], [10,5,7,12,8]);

for (@array) -> @arr {
    say "Input: \@array = ",@arr;
    for @arr.combinations(2) {
        my $x = $_[0] +^ $_[1];
        if ($x > $maxv) {
            $maxv = $x;
        }
    }
    print("Output: $maxv\n");
    $maxv = 0;
    print("\n");
}
