#!/usr/bin/env perl
use v5.36;

use List::Util qw(all);

my $seperator = '/';
my (@paths) = </a/b/c/d /a/b/cd /a/b/cc /a/b/c/d/e>;

my (@path_parts) = sort { @$a <=> @$b }
  map { [ split $seperator ] } @paths;

my @common;
my $first_dirs = shift @path_parts;

for ( my $i = 0; $i < @$first_dirs; $i++ ) {
    last unless all { $first_dirs->[$i] eq $_->[$i] } @path_parts;
    push @common, $first_dirs->[$i];
}

say join $seperator, @common;

