#!/usr/bin/env perl
use v5.36;

package Calc;

use strict;
use warnings;

our $foo;
our @bar;
our %baz;

sub new { bless {}, shift; }
sub add { }
sub mul { }
sub div { }

1;

package main;

say " $_" for sort grep { defined &{"Calc::$_"} } keys %Calc::;
