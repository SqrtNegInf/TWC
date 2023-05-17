#!/usr/bin/env perl
use v5.36;

my $str = 'redivider'; #shift || die "Argument string required\n";
my $len = length $str;

my %eertree;
for my $start (0 .. $len - 1) {
    for my $chars (1 .. $len - $start ) {
        my $w = substr($str, $start, $chars);
        $eertree{$w} = $start.$chars if !exists $eertree{$w} && $w eq reverse $w;
    }
}

sub by_position { $eertree{$a} <=> $eertree{$b} };
say join ' ', sort by_position keys %eertree;
