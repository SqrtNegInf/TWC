#!/usr/bin/env perl

use warnings;
use strict;
use utf8;
use feature ":5.26";
use feature qw(signatures);
no warnings 'experimental::signatures';
use Lingua::EN::Numbers qw( num2en );

my $input = 5;
say magic( $input );

sub magic ($num, $out = '') {
    {
        my $name =  num2en($num);
        $out .= "$name is ";
        $name =~ s/[^a-z]//g;
        $num == 4
            ? return ($out . "magic")
            : ($out .= num2en(  length $name  ) . ', ');
        $num = length $name ;
        redo;
    }
}

sub magicX ($num) {
    my $out;

    while (1) {
        $out .= num2en($num) . " is ";
        $out .= "magic" and return $out if $num == 4 ;
        $out .= num2en(  length num2en( $num )  ) . ', ';
        $num = length num2en( $num ) ;
    }
}
