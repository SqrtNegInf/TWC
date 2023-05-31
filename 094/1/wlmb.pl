#!/usr/bin/env perl
use v5.36;

my %anagrams;
push @{$anagrams{join '', sort split '', $_}}, $_ foreach <opt bat saw tab pot top was>;
say join(" ", @{$anagrams{$_}})foreach sort keys %anagrams;
