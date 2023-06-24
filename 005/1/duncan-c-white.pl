#!/usr/bin/env perl
use v5.36;

my $word = 'animal';
my $wordfile = shift // "words";

#
# my $sig = makesig( $word );
#	Build and return the SIGNATURE of the given word,
#	as described at the top of this program.  Easy to
#	do in Perl, I love "join '' sort split //"
#
sub makesig
{
	my( $word ) = @_;
	return join( '', sort split(//,$word) );
}

my $goalsig = makesig( lc($word) );

open(my $infh, '<', $wordfile) || die "can't open $wordfile\n";
while( <$infh> )
{
	chomp;
	my $sig = makesig( lc($_) );
	print "$_\n" if $sig eq $goalsig;
}
close( $infh );
