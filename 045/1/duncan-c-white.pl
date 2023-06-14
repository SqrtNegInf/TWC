#!/usr/bin/env perl
use v5.36;

my $ncolumns = 8;


#
# my $encodedtext = encode($text);
#	Encode $text according to the above "Square Secret Code" rules.
#	Return the encoded text.
#
sub encode( $text )
{
	my @columns;
	$text =~ s/\s+//g;		# remove all whitespace
	my $len = length($text);
	foreach my $pos (0..$len-1)
	{
		my $ch = substr($text,$pos,1);
		$columns[$pos%$ncolumns] //= "";
		$columns[$pos%$ncolumns] .= $ch;
	}
	#die Dumper \@columns;
	my $result = join( ' ', @columns );
	return $result;
}


#
# my $decodedtext = decode($text);
#	Decode $text according to the above "Square Secret Code" rules.
#	Return the decoded text.
#
sub decode( $text )
{
	my @columns = split( /\s+/, $text );
	my $ncols = @columns;
	die "decode: $text has $ncols columns, not $ncolumns\n"
		unless $ncols == $ncolumns;
	my $npasses = length( $columns[0] );
	my $result = "";
	foreach my $p (1..$npasses)
	{
		foreach (@columns)
		{
			if( $_ )
			{
				s/(^\w)//;	# remove 1st char from column
				$result .= $1;
			}
		}
	}
	return $result;
}


my $text = "The quick brown fox jumps over the lazy dog";
my $decode = shift // 0;
$ncolumns = shift // 8;

my $t;
if( $decode )
{
	$t = decode($text);
} else
{
	$t = encode($text);
}
say $t;
