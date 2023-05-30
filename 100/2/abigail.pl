#!/usr/bin/env perl
use v5.36;

my @nums = map {[/-?[0-9]+/g]} <DATA>;

#
# Calculate the minimum path bottom to top
#
for (my $x = @nums - 2; $x >= 0; $x --) {
    foreach my $y (keys @{$nums [$x]}) {
        $nums [$x] [$y] += $nums [$x + 1] [$y] < $nums [$x + 1] [$y + 1]
                         ? $nums [$x + 1] [$y] : $nums [$x + 1] [$y + 1]
    }
}

say $nums [0] [0];

__END__
1 
2 4 
6 4 9 
5 1 7 2
