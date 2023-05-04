#!/usr/bin/env perl
use v5.36;

&print_1st_unique_char_indx ('Perl Weekly Challenge'); #0
&print_1st_unique_char_indx ('Long Live Perl'); #1


sub print_1st_unique_char_indx ($s) {
	#-- parsimonious use of a single stash entry *s
	my (@s, %s);
	@s = split //, $s;
	for $s (@s) {$s{$s}++;}
	for $s (0 .. scalar(@s)-1) { 
		if ($s{$s[$s]}==1) {
			print $s,"\n";
			last;
		} 
	}
}
