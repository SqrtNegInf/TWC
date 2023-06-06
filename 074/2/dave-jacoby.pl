#!/usr/bin/env perl
use v5.36;

use List::Util qw{ first };

my @strings = qw{
    ababc
    xyzzyx
};

for my $string (@strings) {
    my $output = fnr($string);
    say qq{Input:   $string};
    say qq{Output:  $output};
    say '';
}

sub fnr ( $s ) {
    my @output;
    my @done;
    for my $i ( 0 .. length $s ) {
        my $l = substr( $s, $i, 1 );
        push @done, $l;
        my %hash;
        map { $hash{$_}++ } @done;
        my $o = '#';
        for my $m ( reverse @done ) {
            if ( $hash{$m} < 2 ) { $o = $m; last }
        }
        push @output, $o;

    }
    return join '', @output;
    return uc $s;
}
