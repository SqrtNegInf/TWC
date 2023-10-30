#!/usr/bin/env perl
use warnings;
use strict;

# Example 1
my @words = ("Perl", "Python", "Pascal");
my $acronym = "ppp";
check_acronym($acronym, \@words);
    
# Example 2
@words = ("Perl", "Raku");
$acronym = "rp";
check_acronym($acronym, \@words);

# Example 3
@words = ("Oracle", "Awk", "C");
$acronym = "oac";
check_acronym($acronym, \@words);

sub check_acronym {
    my ($acronym, $words) = @_;
    my $real_acronym;
    foreach (@{$words}) {
	$real_acronym .= substr($_, 0, 1);
    }
    uc($acronym) eq uc($real_acronym) ? print "true\n" : print "false\n";
}
