#!/usr/bin/env perl

use v5.36;
use Test::More;

my $cases = [
    ['Perl', [2,22,19,9]],
    ['Raku', [24,4,7,17]],
];

sub jumping_letters
{
	my ($word, $jump) = @_;
    my $limits = [
		[65,  90],
		[97, 122],
	];

    return undef unless length($word) == @$jump;

    my $ret;
    for (my $i=0; $i < @$jump; ++$i) {
		my $chr = ord(substr($word, $i, 1)); 
		my $lim;
        if ($chr >= 65 and $chr <= 90) {       # 65-90  A-Z
			$lim = 0;
 		} elsif ($chr >= 97 and $chr <= 122) { # 97-122 a-z
			$lim = 1;
		} else {
			return undef;
		}
		$chr += $jump->[$i];
        my $overreach = $chr - $limits->[$lim]->[1];
        $chr = $limits->[$lim]->[0] + $overreach - 1 if $overreach > 0;
		$ret .= chr($chr);
	}

	return $ret;
}

is(jumping_letters($cases->[0]->@*), 'Raku', 'per-to-raku');
is(jumping_letters($cases->[1]->@*), 'Perl', 'raku-to-perl');
done_testing();

exit 0;

