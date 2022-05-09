#!/usr/bin/env raku

my $lines=10;

for 1..$lines {
	state @current=(1);
	say @current.join(" "); #TODO: make a better formating sub
	@current=makeRow(@current);
	
}
sub makeRow(@current) {
	my @next=@current.push: 0;
	my @outRow;
	gather {
		for @next {
			state $previous=0;
			take  $_+$previous;
			$previous=$_;
		}
	}
}
