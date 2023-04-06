#!/usr/bin/env perl
use v5.36;
use Modern::Perl;

sub h_index {
    my(@citations) = @_;
    @citations = sort {$b<=>$a} @citations;     # sort descending
    for my $h (1 .. @citations) {
        return $h-1 if $citations[$h-1] < $h;
    }
    die;
}

say h_index((10,8,5,4,3));
