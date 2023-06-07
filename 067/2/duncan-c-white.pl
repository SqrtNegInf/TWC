#!/usr/bin/env perl
use v5.36;

my $numstring = '249';

my %data = (1 => '_@',
	2 => 'abc',
	3 => 'def',
	4 => 'ghi',
	5 => 'jkl',
	6 => 'mmo',
	7 => 'pqrs',
	8 => 'tuv',
	9 => 'wxyz',
	);

#
# my @out = cross( @str );
#	Given an array of strings, where each string represents
#	alternative letters, form an array of all cross-products
#	of all those letters.
#	eg. cross( 'DEF', 'GHI' ) = ( 'DG', DH', 'DI', 'EG'..)
#
sub cross( @str )
{
	my $first = shift @str;
	my @x = split(//,$first);
	foreach my $next (@str)
	{
		@x = cross_one( $next, @x );
	}
	return @x;
}


#
# my @out = cross_one( $next, @x );
#	Given a string $next (representing alternative letters) and an
#	array of strings @x, form a new array @out which contains every
#	element of @x with every letter in $next appended.
#	eg cross_one( 'DEF', 'X', 'Y' ) gives 'XD', 'XE', 'XF', 'YD'..
#
sub cross_one( $next, @x )
{
	my @out;
	my @letters = split(//,$next);
	foreach my $word (@x)
	{
		foreach my $letter (@letters)
		{
			push @out, $word.$letter;
		}
	}
	return @out;
}


my @str;
foreach my $digit (split(//,$numstring))
{
	die "bad digit $digit in $numstring" unless defined $data{$digit};
	push @str, $data{$digit};
}
#say Dumper \@str;

my @out = cross( @str );
say "[", join(',', map { "'$_'" } @out), "]";
