#!/usr/bin/env perl
use v5.36;

say join "\n", sort map { join ', ', sort @$_ } group_anagrams(<opt bat saw tab pot top was>);

sub group_anagrams {
     my %anagrams;
     push @{$anagrams{ join '', sort split(//,$_)} }, $_ for @_;
     sort values %anagrams
}
