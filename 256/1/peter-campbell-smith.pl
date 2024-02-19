#!/usr/bin/env perl

use v5.26;    # The Weekly Challenge - 2024-02-12
use warnings; # Peter Campbell Smith

use List::Uniq 'uniq';

my (@words, $file);

maximum_pairs('ab', 'de', 'ed', 'bc', 'ed');
maximum_pairs('rotagilla', 'cat', 'dog', 'mouse', 'hen', 'tac', 'alligator', 'esuom');
maximum_pairs('cat', 'cat', 'tac', 'mouse', 'ESUOM');
#maximum_pairs('Kätze', 'fünf', 'café', 'crème', 'éfac', 'fnüf');

# lots of words
#open $file, '<:utf8', '../data/lots_of_words.txt';
#push @words, $_ while <$file>;
##close $file;
#chop @words;
#maximum_pairs(uniq(@words));

sub maximum_pairs {
	
	my (@words, $i, $j, $pairs, $explain, $wi);
	
	# initialise
	push @words, lc($_) for @_;	
	say @words < 40 ? (qq[\nInput:  \@words = ('] . join(q[', '], @words) . q[')])
		: (qq[\nInput: ] . (scalar @words) . qq[ words]);
	
	# loop over word pairs
	ILOOP: for $i (0 .. scalar @words - 2) {
		$wi = reverse $words[$i];
		for $j ($i + 1 .. scalar @words - 1) {
			
			# found a pair?
			if ($words[$j] and $wi eq $words[$j]) {
				$pairs ++;
				$explain .= qq['$words[$i]' and '$words[$j]', ];
				$words[$j] = '';
				next ILOOP;
			}
		}
	}
	
	# report result
	say $pairs ? qq[Output: $pairs\n        ] . substr($explain, 0, -2) :
		say qq[Output: none];
}
