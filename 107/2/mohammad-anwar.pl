#!/usr/bin/env perl
use v5.36;
package Calc;

sub new { bless {}, shift; }
sub add { }
sub mul { }
sub div { }

package main;

print "$_\n" for (sort keys %Calc::);
