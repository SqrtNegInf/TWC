#!/usr/bin/env perl
use v5.36;

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

# build %anag: signature -> list of words with that signature
# and keep track of the signature with the longest list of words
my %anag;
my $longestn   = 0;
my $longestsig = "";
open(my $infh, '<', $wordfile) || die "can't open $wordfile\n";
while( <$infh> )
{
	chomp;
	my $sig = makesig( lc($_) );
	my $aref = ($anag{$sig} //= []);
	push @$aref, $_;

	# keep track of longest(n,sig) as we go
	my $len = @$aref;
	if( $len > $longestn )
	{
		$longestn   = $len;
		$longestsig = $sig;
	}
}
close( $infh );

die "AARGH..\n" if $longestn==0;		# empty wordlist?

#die Dumper \%anag;

# ok, print answer - including the anagrams of the longest set
print "signature with most anagrams ($longestn): $longestsig\n";

my @anag = @{$anag{$longestsig}};

#print "those anagrams are: ".join(',',@anag)."\n";
