#!/usr/bin/env perl
use v5.36;

sub gapful( $i )
{
	$i =~ /^(\d).*(\d)$/;	# find first and largest digits
	my $div = 10*$1 + $2;
	return $i % $div == 0 ? 1 : 0;
}


my $n = shift // 20;

my $found = 0;
for( my $i = 100; $found<$n; $i++ )
{
	next unless gapful( $i );
	say $i;
	$found++;
}
