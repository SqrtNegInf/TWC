#!/usr/bin/env perl
use strict;
use warnings;

sub f{
    my($x) = @_;
    return $x + $x;
}

sub g{
    my($x) = @_;
    return $x * $x;
}

sub compose{
    my($f, $g) = @_;
    return sub{
        my($x) = @_;
        return $f->($g->($x));
    };
}

MAIN:{
    my $h = compose(\&f, \&g);
    print $h->(7) . "\n";
}
