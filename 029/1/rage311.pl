#!/usr/bin/env perl

use 5.028;
use strict;
use warnings;

my $input = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';

die 'No braces to expand' unless
  my ($pre, $exp, $post) = $input =~ /^\s*(.+?)\s*\{(.+)\}\s*(.+?)\s*$/;

say join ' ', $pre, $_, $post for split /,/, $exp;

