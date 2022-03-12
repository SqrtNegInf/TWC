#!/usr/bin/env perl
package Calc;

use strict;
use warnings;

sub new { bless {}, shift; }
sub add { }
sub mul { }
sub div { }

package main;

print "$_\n" for (sort keys %Calc::);
