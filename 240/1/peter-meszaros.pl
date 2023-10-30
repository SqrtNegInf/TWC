#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/fc/;
use Test::More;

my $cases = [
	[["Perl", "Python", "Pascal"], "ppp"],
	[["Perl", "Raku"], "rp"],
	[["Oracle", "Awk", "C"], "oac"],
];

sub acronym
{
	my ($l, $chk) = @{$_[0]};

	my @chk = split('', $chk);
	for my $str (@$l) {
		return 0 if fc(substr($str, 0, 1)) ne fc(shift @chk);
	}
    return 1;
}

is(acronym($cases->[0]), 1, '[["Perl", "Python", "Pascal"], "ppp"]');
is(acronym($cases->[1]), 0, '[["Perl", "Raku"], "rp"]');
is(acronym($cases->[2]), 1, '[["Oracle", "Awk", "C"], "oac"]');
done_testing();

exit 0;


