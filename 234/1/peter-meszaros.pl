#!/usr/bin/env perl
use v5.36;

use Test::More;

my $cases = [
    ["java", "javascript", "julia"],
    ["bella", "label", "roller"],
    ["cool", "lock", "cook"],
];

sub common_characters
{
	my $l = shift;

    my $word = shift @$l;
    my $len = @$l;
	my @word = split('', $word);
    my @res;

    for my $c (@word) {
		my $cnt = 0;
		for my $w (@$l) {
			++$cnt if $w =~ s/$c//;
		}
		push @res, $c if $cnt == $len;
	}

	return \@res;
}

is_deeply(common_characters($cases->[0]), ["j", "a"],      '["java", "javascript", "julia"]');
is_deeply(common_characters($cases->[1]), ["e", "l", "l"], '["bella", "label", "roller"]');
is_deeply(common_characters($cases->[2]), ["c", "o"],      '["cool", "lock", "cook"]');
done_testing();

exit 0;
