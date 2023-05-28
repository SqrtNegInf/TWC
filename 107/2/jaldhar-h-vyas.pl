#!/usr/bin/env perl
use v5.36;

package Calc
{
     use strict;
     use warnings;

     sub new { bless {}, shift; }
     sub add { }
     sub mul { }
     sub div { }
     1;
}
package main;

for my $key (sort keys %Calc::) {
    say $key;
}
