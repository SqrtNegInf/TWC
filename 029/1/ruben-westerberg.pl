#!/usr/bin/env perl
use v5.36;

$_='Perl {Daily,Weekly,Monthly,Yearly} Challenge';

my @positions;
my @entries;

#Match multiple brace expansions in a single string
while (/{[^}]*}/g) {
	push @positions,[$-[0], $+[0]];
	push @entries, [ split /[{},]/, substr $_, $-[0]+1,$+[0]-$-[0]-1];
}

print expand($_,[],\@entries, \@positions);

sub expand {
	my @results;
	my ($line,$stack,$entries,$positions)=@_;
	if (@$stack == @$entries) {
		my $l=$line;
		my $offset=0;
		for (0..@$stack-1) {		
			substr $l, $$positions[$_]->[0]+$offset, $$positions[$_]->[1]-$$positions[$_]->[0], $$stack[$_];
			$offset+=($$positions[$_]->[0]-$$positions[$_]->[1]) +length $$stack[$_];
		}
		return $l."\n";
	}
	else {
		my @s;
		my $e= $$entries[@$stack];
		for (0..@$e-1) {
			@s=(@$stack, $$e[$_]);
			push @results, expand($line,\@s,$entries,$positions);
		}
		return @results;
	}
}

