#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

# original tries to produce stable output, but fails, see if I can manage it...
print join "\n", map { join ', ', sort { $a cmp $b } @$_ } group_anagrams("opt", "bat", "saw", "tab", "pot", "top", "was");

#my @groups = group_anagrams("opt", "bat", "saw", "tab", "pot", "top", "was");
##print join(", ", @$_), $/ for sort { $a cmp  $b } @groups; 
#print join "\n", map { sort { $a cmp  $b } $_ } map { join ', ', sort { $a cmp $b } @$_ } @groups; 

sub group_anagrams
{
     my @strings = @_;

     my %anagrams;
     push @{$anagrams{standard($_)}}, $_ for sort @strings;
     return sort values %anagrams;
}

sub standard
{
     my $string = $_[0];
     return join('',sort {$a cmp $b} split(//,$string));
}
