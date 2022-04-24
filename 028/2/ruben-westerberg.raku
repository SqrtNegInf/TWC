#!/usr/bin/env raku

die 'not ok - disabled: not testable';

my $offset=0;
#my @codes=("\x1b[{$offset}D"
react { whenever Supply.interval(.1) {
	print "=";
} 
	whenever Supply.interval(1) {
		print "\x1b[2K";
		 print "\x1b[1000D";
		print DateTime.now.hh-mm-ss;
	 }
}




