#!/usr/bin/env perl

use Modern::Perl;

my $n = shift || 20;
for (1 .. $n) {
    say(($_%15)==0 ? "fizzbuzz" : ($_%3)==0 ? "fizz" : ($_%5)==0 ? "buzz" : $_);
}
