#!/usr/bin/env perl
use v5.16;

use utf8;
use strict;
use warnings;

special_notes('abc', 'xyz');
special_notes('scriptinglanguage', 'perl');
special_notes('aabbcc', 'abc');
special_notes('gorge', 'george');
special_notes('fornowisthetimeforallgoodpeopletocometotheaidofthebaby', 'hyperbolicparaboloid');

sub special_notes {
    
    my ($source, $target, $letter, %letters, $good);
    
    ($source, $target) = @_;
    
    # split $source into individual letters
    for $letter (split('', $source)) {
        $letters{$letter} ++;
    }    
        
	# check if $target has any letters not in $source
	$good = 'true';
	for $letter (split('', $target)) {
		if ($letters{$letter}) {
			$letters{$letter} --;
		} else {
			$good = 'false ';
			last;
		}
	}
	
	# show answer
    say qq[\nInput:  \$source = '$source'\n        \$target = '$target'];
    say qq[Output: $good];
    
}
