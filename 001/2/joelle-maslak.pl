#!/usr/bin/env perl
use v5.36;
#use strict;
#use warnings;

for (my $i=1; $i<=20; $i++) { if (! ($i % 15) ) { say "fizzbuzz" } elsif (! ($i % 5) ) { say "buzz" } elsif (! ($i % 3) ) { say "fizz" } else { say $i } }
