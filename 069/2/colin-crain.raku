#!/usr/bin/env raku

sub MAIN ( Int $n = 7) {
    S($n).say;
}

sub S ($n) {
    return '' unless $n;
    my $str = S($n-1);
    $str ~ '0' ~ $str.trans('01'=>'10').flip;
}
