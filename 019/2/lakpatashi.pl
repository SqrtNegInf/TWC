#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

#part 2
my $str = "This is random string to be formatted and wrap to given length";
my $LineWidth = 10;
my $SpaceLeft = $LineWidth;
my $SpaceWidth = 1;

for my $word (split / /,$str){
    if ( length($word) + $SpaceWidth > $SpaceLeft ){
		#insert line break before Word in Text
		print "\n$word";
		$SpaceLeft = $LineWidth - length($word);
	}else{
		print " $word";
		$SpaceLeft -= (length($word) + $SpaceWidth);
	}
}
