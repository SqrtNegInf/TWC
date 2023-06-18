#!/usr/bin/env perl
use v5.36;

my $input = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';

die 'No braces to expand' unless
  my ($pre, $exp, $post) = $input =~ /^\s*(.+?)\s*\{(.+)\}\s*(.+?)\s*$/;

say join ' ', $pre, $_, $post for split /,/, $exp;

