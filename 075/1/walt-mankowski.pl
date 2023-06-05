#!/usr/bin/env perl
use v5.36;

my $s = 6; my @c = <1 2 4>;
my @solutions;

my @cnt = map {0} 0..$#c;
while (1) {
    my $val = value(\@c, \@cnt);
    if ($val >= $s) {
        if ($val == $s) {
            my @tmp = @cnt;
            push @solutions, \@tmp;
        }

        # rotate "odometer"
        $cnt[-1] = 0;
        my $i = -2;
        $cnt[$i]++;
        while ($i >= -@c && value(\@c, \@cnt) > $s) {
            $cnt[$i] = 0;
            $i--;
            $cnt[$i]++ if $i >= -@c;
        }
        last if $i < -@c;
    } else {
        $cnt[-1]++;
    }
}

# print out the solutions
say "There are " . scalar @solutions . " ways to make sum $s";
for my $sol (@solutions) {
    my @tmp;
    for my $i (0..$#c) {
        push @tmp, $c[$i] for 0..$sol->[$i]-1;
    }
    say "@tmp";
}

sub value($c, $cnt) {
    my $sum = 0;
    for my $i (0..$#$c) {
        $sum += $c->[$i] * $cnt->[$i];
    }
    return $sum;
}
