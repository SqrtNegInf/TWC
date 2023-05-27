#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);
use Text::CSV qw(csv);
my $input=csv(in=>'example.csv');
my $Ncols=max map {scalar @{$input->[$_]}} @$input-1;
my $transposed=[map {my $c=$_; [map {$input->[$_][$c]} 0..@$input-1]} 0..$Ncols-1];
csv(in=>$transposed, out=>*STDOUT, eol=>$/);
