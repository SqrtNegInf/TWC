#!/usr/bin/env raku

my @p=(0..*).grep: *.is-prime;
my @pp=[\*] @p;
my @e=@pp.map: *+1;
for @e {
	last unless .is-prime;
	LAST .say;
}
