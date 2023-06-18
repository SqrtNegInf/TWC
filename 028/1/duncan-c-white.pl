#!/usr/bin/env perl
use v5.36;

foreach my $filename ($0)
{
	my $binary = ClassifyBinaryOrText( $filename );
	say "file $filename is ", $binary?"binary":"text";
}

my %knownbinary = map { $_ => 1 }
qw(tar gz bz2 tbz tbz2 tgz tar.gz tar.bz2 tar.bz Z tar.Z
   zip jpg gif png cpio out a o);


#
# my $binary = ClassifyBinaryOrText( $filename );
#	Classify filename into binary or text without reading
#	the content =s (why???).  So based on the extension then.
#	Returns 1 for binary, 0 for text.
#
sub ClassifyBinaryOrText( $filename )
{
	my $ext = $filename;
	$ext =~ s|^[^.]+/\.|| or return 0;
	return 1 if $knownbinary{$ext};
	return 0;
}
