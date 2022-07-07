#!/usr/bin/env perl

# original tried to produce stable output, but failed, see if I can manage it...
# can't stop fiddling with this for some reason...

use v5.36;

say join "\n", sort map { join ', ', sort @$_ } group_anagrams(<opt bat saw tab pot top was>);

sub group_anagrams {
     my %anagrams;
     push @{$anagrams{ join '', sort split(//,$_)} }, $_ for @_;
     sort values %anagrams
}
