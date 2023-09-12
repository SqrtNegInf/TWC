#!/usr/bin/env perl
use v5.16;

use strict;
use warnings;

similar_words('aba', 'aabb', 'abcd', 'bac', 'aabc');
similar_words('aabb', 'ab', 'ba');
similar_words('nba', 'cba', 'dba');
similar_words(qw[discovery cervid ciders coders corves cosied cosier covers coveys 
	credos cyders decors decoys descry devoir dicers dioecy divers dories drives droves 
	scored scried scrive videos vireos voiced voicer voices voider]);

sub similar_words {
	
	my (@words, $j, $k, $pairs, $rubric);
	@words = @_;
	$pairs = 0;
	
	# sort letters within each word and remove duplicates
	for ($j = 0; $j < scalar @words; $j ++) {
		$words[$j] = join('', sort(split('', $words[$j])));
		$words[$j] =~ s|(.)\1+|$1|g;
		
		# compare the result with all previous results
		if ($j > 0) {
			for ($k = 0; $k < $j; $k ++) {
				
				# we have a pair
				if ($words[$k] eq $words[$j]) {
					$pairs ++;
					$rubric .= qq[        Pair $pairs: similar words ('$_[$j]', '$_[$k]')\n];
				}
			}
		}
	}
	
	# report
	say qq[\nInput:  \@words = ('] . join(qq[', '], @_) . qq[')];
	say qq[Output: $pairs];
	say substr($rubric, 0, -1) if $pairs;
}
