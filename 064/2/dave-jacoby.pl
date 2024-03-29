#!/usr/bin/env perl
use v5.36;

use Carp;

my @input;
push @input, [ "perlweeklychallenge", "weekly", "challenge", "perl" ];
push @input, [ "perlandraku",         "python", "ruby",      "haskell" ];

for my $i (@input) {
    my $s = shift $i->@*;
    my @w = $i->@*;
    my $out = wordbreak( $s, @w );
    say $out;
}

sub wordbreak ( $s, @w ) {
    my @permutations = permute_array( \@w );
    for my $perm (@permutations) {
        my $str = join '', $perm->@*;
        return join ',', map { qq{"$_"} } $perm->@* if $str eq $s;
    }
    return 0;
}

sub permute_array ( $array ) {
    return $array if scalar $array->@* == 1;
    my @response = map {
        my $i        = $_;
        my $d        = $array->[$i];
        my $copy->@* = $array->@*;
        splice $copy->@*, $i, 1;
        my @out = map { unshift $_->@*, $d; $_ } permute_array($copy);
        @out
    } 0 .. scalar $array->@* - 1;
    return @response;
}
