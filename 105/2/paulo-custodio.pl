#!/usr/bin/env perl
use v5.36;

my $name = 'Katie';
my $end = $name =~ s/^[bcdfghjklmnpqrstvwxyz]//ir;
my $b = ($name =~ /^b/i) ? "" : "b";
my $f = ($name =~ /^f/i) ? "" : "f";
my $m = ($name =~ /^m/i) ? "" : "m";

say "$name, $name, bo-$b$end,";
say "Bonana-fanna fo-$f$end";
say "Fee fi mo-$m$end";
say "$name!";
