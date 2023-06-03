#!/usr/bin/env perl
use v5.36;

my @N = (2,1,4,1,2,5);

# draw histogram
my @hist = draw_hist(@N);

# count spaces between walls, replace them by 'x'
for (@hist) {
    1 while s/#( +)#/'#'.('x' x length($1)).'#'/e;
}

# count x
my $count = sum(map {tr/x/x/} @hist);

say $count;

sub draw_hist {
    my(@n) = @_;
    my $max = max(@n);
    my @hist;
    for my $row (0..$max-1) {
        my $n = $max-$row;
        my $line = '';
        for my $col (0..$#n) {
            $line .= $n[$col] >= $n ? '#' : ' ';
        }
        push @hist, $line;
    }
    return @hist;
}

sub max {
    my($max, @a) = @_;
    for (@a) {
        $max = $_ if $max < $_;
    }
    return $max;
}

sub sum {
    my($sum, @a) = @_;
    $sum += $_ for @a;
    return $sum;
}
