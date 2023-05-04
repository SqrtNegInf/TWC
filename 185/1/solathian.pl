#!/usr/bin/env perl
use v5.36;

sub mac($string)
{
    $string =~ s/(.{2})(.{2})   \.  (.{2})(.{2})     \.  (.{2})(.{2})/$1:$2:$3:$4:$5:$6/x;
    
    say $string;
}
