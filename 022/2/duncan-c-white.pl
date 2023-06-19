#!/usr/bin/env perl
use v5.36;

use lib qw(.);	# I hate this!
use LZW;

my @dict = ( 'A'..'Z' );

lzw_setdict( @dict );
lzw_setdebug( 1 );

my $op = 'E';
my $arg = 'FRABJOUS';

#die "debug: np2(1023)==", np2(1023), "\nnp2(1024)==", np2(1024), "\nnp2(1025)==", np2(1025);

if( $op eq 'E' )
{
	my $binstr = lzw_encode( $arg );
	print "$binstr\n";
}
elsif( $op eq "D" )
{
	my $text = lzw_decode( $arg );
	print "$text\n";
}
