#!/usr/bin/env perl
use v5.36;

my @base      = ( 0 .. 9, 'a' ... 'z' );
my %to_base   = map { state $c = 0; $_ => $c++ } @base;
my %from_base = reverse %to_base;

for my $n ( reverse 7 .. 37 ) {
    my $s = get_self($n);
    next unless check_self( $s, $n );
    say join "\t", $n, $s;
}

sub check_self ( $s, $n ) {
    no warnings;
    my @s = split //, $s;
    my $b = $s[0];
    my @check;

    for my $i ( 0 .. $n - 1 ) {
        my $eye = $from_base{$i};

        my $c = $s[$i];

        my @all = grep { $_ eq $eye } @s;
        my $all = join ',', @all;

        my $j   = scalar @all;
        my $jay = $from_base{$j};

        return 0 if $c ne $jay;
    }

    return 1;
}

sub get_self( $n ) {
    my @output = map { 0 } 1 .. $n;
    my $b      = $n - 4;
    $output[0]  = $from_base{$b};
    $output[1]  = 2;
    $output[2]  = 1;
    $output[$b] = 1;
    return join '', @output;
}
