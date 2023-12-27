#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Data::Dumper;

my $cases = [
	[ "loveleetcode", "e"],
	[ "aaab",         "b"],
];

sub shortest_distance
{
	sub get_pos
	{
		my $pos = shift;
		my $n   = shift;

		my @res;
		for (0..$#$pos) {
			if ($_ == 0 && $n < $pos->[$_]) { # smaller than zeroth item
                @res = (undef, $pos->[$_]);
                last;
            } elsif ($_ == $#$pos && $n > $pos->[$_]) { # bigger than last item
                @res = ($pos->[$_], undef);
                last;
            } elsif ($n < $pos->[$_] && $n > $pos->[$_-1]) {
                @res = ($pos->[$_-1], $pos->[$_]);
                last;
            }
		}
		return @res;
	}

	my $str = $_[0]->[0];
	my $chr = $_[0]->[1];

	my @str = split('', $str);

	# get chr positions
	my @pos;
	for (0..$#str) {
		push @pos, $_ if $str[$_] eq $chr;
	}
	@pos = sort {$a <=> $b} @pos;

	my @ret;
	for my $n (0..$#str) {
		my $d = 0;
	
        # calculate distances
		if ($str[$n] ne $chr) {
			my @p = get_pos(\@pos, $n);

            if (defined $p[0]) {
                $d = abs($p[0] - $n);
            }
            if (defined $p[1]) {
                my $d2 = abs($p[1] - $n);
                $d = $d2 if $d == 0 or $d2 < $d;
            }
		}
        push @ret, $d;
	}

	return \@ret;
}

is_deeply(shortest_distance($cases->[0]), [3,2,1,0,1,0,0,1,2,2,1,0], '[ "loveleetcode", "e"]');
is_deeply(shortest_distance($cases->[1]), [3,2,1,0],                 '[ "aaab",         "b"]');
done_testing();

exit 0;
