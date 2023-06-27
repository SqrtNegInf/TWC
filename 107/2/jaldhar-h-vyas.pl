#!/usr/bin/env perl
use v5.36;

package Calc
{
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
