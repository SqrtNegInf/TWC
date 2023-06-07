#!/usr/bin/env perl
use v5.36;

my $bits = shift @ARGV // 4;

say "[ ", (join ', ', grey_code($bits)->@*), " ]";

## ## ## ## ## SUBS:

sub grey_code {
    my $s = shift;
    return [0, 1] if $s == 1;       ## edge case
    return [ map { oct("0b".$_) } map {
        my $n = $_;
        my $fmt = '%0' . ($s-1) . "b";
        my @gc = map {sprintf $fmt, $_} grey_code($s-1)->@*;
        map { $n . $_ } $_ ? reverse @gc : @gc;
    } (0,1)  ];
}
