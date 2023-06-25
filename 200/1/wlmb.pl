#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);

my @in= <9 1 2 3 4 4 3 2 1 9>;
say "The arithmetic slices of [ ", join " ", @in, "] are\n[";
my @results=
    grep {
	my @m=@$_;
	my @diff;
	$diff[$_]=$m[$_+1]-$m[$_] for 0..@m-2;
	uniq(@diff)==1
    }
    map {
	my $start=$_;
	map {[@in[$start..$_]]}$start+2..@in-1
    } 0..@in-3;
say "    [@$_]" for @results;
say "]";
