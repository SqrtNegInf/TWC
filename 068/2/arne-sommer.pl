#!/usr/bin/env perl
use v5.36;

use List::SomeUtils qw/zip/;
use POSIX;

my @ARGV = 1..10;
my $last   = $#ARGV;
my $half   = ceil($last / 2 -1);
my @first  = @ARGV[0 .. $half];
my @second = reverse(@ARGV[$half+1 .. $last]);

say join(" -> ", grep { defined $_ } zip(@first, @second));
