#!/usr/bin/env perl
use v5.36;

use Test::More;
use List::MoreUtils qw(uniq);
use List::Util qw(reduce);

my $cases = [
    ["aba", "aabb", "abcd", "bac", "aabc"],
    ["aabb", "ab", "ba"],
    ["nba", "cba", "dba"],
];

sub similar_words
{
    my $l = shift;
    
    my %h;
	for my $w (@$l) {
		++$h{join('', sort(uniq(split('', $w))))};
	}
    my $cnt = 0;
    for my $l (keys %h) {
		my $v = $h{$l};
        if ($v > 1) {
            my $n += reduce { $a * $b } 1 .. $v; # n!
            my $nk += ($v == 2 ? 1 : reduce { $a * $b } 1 .. ($v - 2)); # (n-k)!
            $cnt += $n / (2 * $nk); # n!/k!(n-k)!
        }
    }
	return $cnt; 
}

is(similar_words($cases->[0]), 2, '["aba", "aabb", "abcd", "bac", "aabc"]');
is(similar_words($cases->[1]), 3, '["aabb", "ab", "ba"]');
is(similar_words($cases->[2]), 0, '["nba", "cba", "dba"]');
done_testing();
