#!/usr/bin/env perl
use Modern::Perl;
use Math::Prime::Util qw(is_prime);

# Write a script to print first 10 Sexy Prime Pairs
#
my $limit = shift || 10;
my $SEXY = 6;
my $p = 3;
my %sexy_prime;
while (keys %sexy_prime < $limit) {
	$sexy_prime{$p} = $p+$SEXY if (is_prime($p) and is_prime($p+$SEXY));
	$p+=2;
}

say "($_, $sexy_prime{$_})" foreach (sort {$a <=> $b} (keys %sexy_prime));
