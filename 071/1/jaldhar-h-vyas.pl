#!/usr/bin/env perl
use v5.36;
srand 1;

use English qw/ -no_match_vars /;

sub pick {
    my @list = @{$_[0]};
    my $length = scalar @list;
    my $n = $_[1] // 1;
    my @picked;

    while (scalar @picked != $n) {
        my $pos = int(rand($length));
        if (defined $list[$pos]) {
            push @picked, $list[$pos];
            $list[$pos] = undef;
        }
    }

    return wantarray ? @picked : $picked[0];
}

my $N = shift // 20;

my @arr = pick([1 .. 50], $N);
my @peak;

for my $i (0 .. (scalar @arr - 1)) {
    if ($arr[$i] > ($arr[$i - 1] // 0) && $arr[$i] > ($arr[$i + 1] // 0)) {
        push @peak, $arr[$i];
    }
}
say 'array: ', (join q{, }, @arr);
say 'Peak: ', (join q{, }, @peak);
