#!/usr/bin/env perl
use v5.36;

if (@ARGV) {
    for my $string (@ARGV) {
        say $string;
        say join ', ', map { qq{"$_"} } split_on_change($string);
        say '';
    }
}
else {
    my $string = 'bookkeeper';
    say join ', ', map { qq{"$_"} } split_on_change($string);
    say '';
}

sub split_on_change ( $string ) {
    my @array;
    my $cache = '';
    for my $l ( split //, $string ) {
        state $m = '';
        if ( $l eq $m ) {
            $cache .= $l;
        }
        else {
            $m = $l;
            push @array, $cache;
            $cache = $l;
        }
    }
    push @array, $cache;
    @array = grep { length $_ } @array;
    return wantarray ? @array : \@array;
}
