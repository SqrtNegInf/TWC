#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

# original tries to produce stable output, but fails, see if I can manage it...
say join "\n", sort map { join ', ', sort { $a cmp $b } @$_ } group_anagrams("opt", "bat", "saw", "tab", "pot", "top", "was");

#my @groups = group_anagrams("opt", "bat", "saw", "tab", "pot", "top", "was");
#print join(", ", @$_), $/ for sort { $a cmp  $b } @groups; 

sub group_anagrams {
     my @strings = @_;
     my %anagrams;
     push @{$anagrams{standard($_)}}, $_ for @strings;
     return sort values %anagrams;
}

sub standard {
     my $string = shift;
     return join('',sort {$a cmp $b} split(//,$string));
}
