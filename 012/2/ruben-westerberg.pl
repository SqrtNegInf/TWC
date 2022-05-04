#!/usr/bin/env perl

use strict;
use warnings;
use v5.26;
my $separator='/';
my @list=</a/b/c/d /a/b/cd /a/b/cc /a/b/c/d/e>;
my @path=map { [ (split $separator, $_)]} @list;
my @sortedPath=sort {@$a <=> @$b} @path;
my $min=@{$sortedPath[0]};
print "/" unless $min >0;
my @common;

for (my $i=0; $i< $min; $i++) {
	my @line;
	my $sum=0;
	my $f=${$sortedPath[0]}[$i];
	for (my $j=0; $j< @sortedPath;$j++) {
		my $c=${$sortedPath[$j]}[$i];
		$sum++ if $f eq  $c;
	}
	push @common, $f if $sum == @sortedPath;
}
print join "/", @common;
