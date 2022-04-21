#!/usr/bin/env raku

my $fh = open  "example.txt" , :r;

my %count;
%count{ $fh.get }++ while ! $fh.eof;

my $key_width = %count.  keys.map({.chars}).max;
my $int_width = %count.values.map({.chars}).max;
my $fmt = "%-{$key_width}s %{$int_width}d\n";

$fmt.printf(.key, .value) for %count.sort: { .value, .key };
