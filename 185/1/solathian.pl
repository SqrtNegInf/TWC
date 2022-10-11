#!/usr/bin/env perl
use strict;
use warnings;

use feature ('say', 'signatures');
no  warnings 'experimental';

sub mac($string)
{
    $string =~ s/(.{2})(.{2})   \.  (.{2})(.{2})     \.  (.{2})(.{2})/$1:$2:$3:$4:$5:$6/x;
    
    say $string;
}
