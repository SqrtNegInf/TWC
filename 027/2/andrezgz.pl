#!/usr/bin/env perl
use v5.36;

my $x;
my $x_ops= 'my $x = 10; $x = 20; $x -= 5;';

my @log;
push @log, eval $_ for (split /;/, $x_ops);
print join "\n",@log;
