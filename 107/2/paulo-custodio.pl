#!/usr/bin/env perl
use v5.36;

{
    package Calc;
    sub new { bless {}, shift; }
    sub add { }
    sub mul { }
    sub div { }
}

show_methods('Calc');

sub show_methods {
    my($package) = @_;
    no strict 'refs';
    for my $symbol (sort keys %{$package."::"}) {
        say $symbol if exists &{$package."::".$symbol};
    }
}
