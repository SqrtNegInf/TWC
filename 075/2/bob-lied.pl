#!/usr/bin/env perl
use v5.36;

use lib ".";
use LargestRectangleHistogram;

my @A = <2 1 4 5 3 7>;
die "Usage: list of positive integers" unless @A;

my $lrh = LargestRectangleHistogram->new(@A);

# $lrh->_show();
say "Max area: ", $lrh->findLRH();

$lrh->display();

