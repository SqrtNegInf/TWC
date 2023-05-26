#!/usr/bin/env perl
use v5.36;

my @numbers = qw{ 1234 91011 10203 };

for my $n (@numbers) {
    say base($n);
}

sub base ( $n ) {
    my $s = get_sequence($n);
    return $s//$n;
}

sub get_sequence ( $n ) {
    my $t = test($n);
    return $n if $t;

    my $output;
    my @n = split /,/, $n;
    my $flag = 0;
    map { $flag += 1 if $_ > 10 } @n;
    if ( $flag > 0 ) {
        for my $i ( 0 .. length $n ) {
            my $cp = $n;
            my $l = substr( $cp, $i, 1 );
            substr( $cp, $i, 1 ) = ',' . $l;
            next if $cp =~ m{^\,|\,\,|\,$};
            my $x = get_sequence($cp);
            return $x if $x;
        }
    }
    return undef;
}

sub test ( $n ) {
    my $t = 1;
    my @n = split /,/, $n;
    $t = 0 if $n[0] =~ m{^0}mx;
    $t = 0 if scalar @n < 2;
    for my $i ( 1 .. -1 + scalar @n ) {
        my $h = $i - 1;
        $t = 0 if $n[$i] =~ m{^0}mx;
        $t = 0 unless $n[$h] + 1 == $n[$i];
    }
    return $t;
}
