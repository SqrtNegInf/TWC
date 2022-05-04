#!/usr/bin/env perl

my $n = 5;

die "ch-2.pl: n ($n) must be > 0\n" unless $n>0;

for( $row=0; $row<$n; $row++ )
{
	my $line ='';
	for( $col=0; $col<$n; $col++ )
	{
		my $ch = ($row==$col)?'1':'0';
		$line .= $ch;
	}
	print "$line\n";
}
