#!/usr/bin/env perl

use v5.36;
my @A = '110';

my %patterns;

@patterns{qw(0 10 11)}=qw(a b c);
for(@A){
    my $last;
    die "Not a binary pattern: $_\n" unless /^(0|1)+/; #Check input
    say " $_ -> ",
        (
	 map {$last=$patterns{$_}}
	 grep {length $_}
	 split /(1.|0)/
	),
	" -> ",
	$last eq "a"?1:0;
}
