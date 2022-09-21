#!/usr/bin/env perl

use v5.28;
use utf8;
use warnings;

common_folder(
 qw[/a/b/c/1/x.pl
    /a/b/c/d/e/2/x.pl
    /a/b/c/d/3/x.pl
    /a/b/c/4/x.pl
    /a/b/c/d/5/x.pl]);
	
common_folder(
 qw[/a/b/c/x.pl 
	/d/e/f/x.pl]);
	
common_folder(
 qw[/m/n/o/p/xx
	/m/n/o/p/xx]);	
	
sub common_folder {
	
	my (@paths, $guess, $try, $path, $good);
	@paths = @_;
	
	# show input
	say qq[\nInput:\n    ] . join(qq[\n    ], @paths);
	
	# get the path to the first one
	$paths[0] =~ m|(.*/)|;
	$guess = $1;

	# work backwards, stripping off the last folder
	TRY: for $try (1 .. 99) {
		
		# loop over the rest to see if they match
		$good = 1;
		for $path (@paths) {
			unless ($path =~ m|^$guess|) {
				$good = 0;
				last;
			}
		}
		# found the answer
		last if $good;
		
		# remove the last folder and try again
		$guess =~ s|/[^/]*/$|/|;
	}
	say qq[Output:\n    ] . substr($guess, 0, -1);
}	

	
