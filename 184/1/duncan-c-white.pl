#!/usr/bin/env perl
use v5.36;
use Getopt::Long;
use Data::Dumper;


my $debug=0;

#
# my $seqstr = seqno( $str );
#	Given a string in the format aa9999 i.e. first 2 characters
#	can be anything 'a-z' followed by 4 digits '0-9', 
#	replace the first two characters with sequence starting
#	with '00', '01', '02' etc.
#
sub seqno
{
	my( $str ) = @_;
	state $seqno = 0;
	die "bad format $str: not lldddd\n" unless $str =~ /^(\w\w)(\d\d\d\d)$/;
	$str = sprintf( "%02d%s", $seqno++, $2 );
	return $str;
}


my @list = <ab1234 cd5678 ef1342>;

say join( ',', map { seqno($_) } @list );
