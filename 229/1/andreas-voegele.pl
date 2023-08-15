#!/usr/bin/env perl
use v5.36;

sub is_ordered_ascending (@chars) {
    while (@chars >= 2) {
        return 0 if shift @chars gt $chars[0];
    }
    return 1;
}

sub is_ordered_descending (@chars) {
    while (@chars >= 2) {
        return 0 if shift @chars lt $chars[0];
    }
    return 1;
}

sub is_ordered (@chars) {
    while (@chars >= 2) {
        my $c1 = shift @chars;
        my $c2 = $chars[0];
        return is_ordered_ascending(@chars)  if $c1 lt $c2;
        return is_ordered_descending(@chars) if $c1 gt $c2;
    }
    return 1;
}

for ([qw(abc bce cae)], [qw(yxz cba mon)]) {
    my @strings = @{$_};
    say @strings - grep { is_ordered(split //) } @strings;
}
