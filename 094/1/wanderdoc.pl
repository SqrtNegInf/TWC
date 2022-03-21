#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


my @groups = group_anagrams("opt", "bat", "saw", "tab", "pot", "top", "was");
print join(", ", @$_), $/ for @groups; 
print $/;
@groups = group_anagrams("x"); 
print join(", ", @$_), $/ for @groups;

sub group_anagrams
{
     my @strings = @_;

     my %anagrams;
     push @{$anagrams{_standard($_)}}, $_ for sort @strings;
     return sort values %anagrams;
}

sub _standard
{
     my $string = $_[0];
     return join('',sort {$a cmp $b} split(//,$string));
}
