#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
	["Perl", "Rust", "Raku"],
	["love", "live", "leave"],
];

sub common_characters
{
	my $l = shift;

    my %h;
	for (@$l) {
		++$h{$_} for (split('', lc));
	}
    my $len = @$l;
	my @r;
	for (keys %h) {
		push @r, $_ if $h{$_} >= $len;
	}
	@r = sort @r;

    return \@r;
}

is_deeply(common_characters($cases->[0]), ["r"],           '["Perl", "Rust", "Raku"]');
is_deeply(common_characters($cases->[1]), ["e", "l", "v"], '["love", "live", "leave"]');
done_testing();
