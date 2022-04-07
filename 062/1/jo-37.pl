#!/usr/bin/env perl

use strict;
use warnings;

our ($u, $t) = (0,1);

*ARGV = *DATA{IO} if $t;

my @addr;
while (<>) {
	chomp;
	my ($local, $domain) = split '@', $_, 2;
	die "not an email address: $_" unless $local && $domain;
	push @addr, {local => $local, domain => lc($domain), full => $_};
}
my @sorted = sort {$a->{domain} cmp $b->{domain} || 
		lc($a->{local}) cmp lc($b->{local}) ||
		$a->{local} cmp $b->{local}} @addr;

my $result;
if ($u) {
	my $last;
	my @uniq = grep {my $eq = $last &&
		$last->{domain} eq $_->{domain} &&
		$last->{local} eq $_->{local}; $last = $_; !$eq} @sorted;
	$result = \@uniq;
} else {
	$result = \@sorted;
}

print "$_\n" for map {$_->{full}} @$result;

__DATA__
name@example.org
rjt@cpan.org
Name@example.org
rjt@CPAN.org
user@alpha.example.org
