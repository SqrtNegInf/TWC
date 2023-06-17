#!/usr/bin/env perl
use v5.36;

use POSIX;

sub check {
    my ( $numerator, $denominator ) = @_;

    ( $numerator + $denominator == $numerator ) && ( $denominator == floor $denominator ) && die 'divide by zero error';
}

check (42,1);
check (42,0);
