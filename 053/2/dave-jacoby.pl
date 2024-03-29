#!/usr/bin/env perl
use v5.36;

my $l = 3;

my @strings = vowel_strings($l);
say join "\n", @strings;

sub vowel_strings ( $l, $string = '' ) {
    if ( length $string == $l ) {
        return $string;
    }
    my @next;
    my $m = length $string == 0 ? '' : substr $string, -1;
    if ( $string eq '' ) {
        @next = qw{ a e i o u};
    }
    elsif ( $m eq 'a' ) {
        @next = qw{ e i };
    }
    elsif ( $m eq 'e' ) {
        @next = qw{ i };
    }
    elsif ( $m eq 'i' ) {
        @next = qw{ a o u e };
    }
    elsif ( $m eq 'o' ) {
        @next = qw{ a u };
    }
    elsif ( $m eq 'u' ) {
        @next = qw{ o e };
    }

    my @output;
    for my $n (@next) {
        push @output, vowel_strings( $l, $string . $n );
    }
    return @output;

}
