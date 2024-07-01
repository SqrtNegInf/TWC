#!/usr/bin/env perl
use v5.36;

my $sentence = 'Perl Weekly Challenge';
my $badkeys = ('l');
my $count = scalar grep {! /[$badkeys]/i} split /\s+/, $sentence;
say $count;
