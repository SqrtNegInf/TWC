#!/usr/bin/env perl
use v5.36;

my $f = sub ( $sub ) {
    return sub ( $x ) { return uc $sub->($x) }
};

my $g = sub ( $val ) {
    return join ' ', map { $val } 1 .. 3;
};

my $h = compose( $f, $g );
say join " / ", $h->(qw{ sub refs are fun });

sub compose ( $f, $g ) {
    my $sub = $f->($g);
    return sub ( @x ) {
        return map { $sub->($_) } @x;
    }
}
