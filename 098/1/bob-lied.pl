#!/usr/bin/env perl
use v5.36;

my $FILE = 'input.txt';
my $N        = 4;

#die Usage() unless $FILE;
#die Usage() unless $N;
die "Need positive N" if ( $N <= 0 );

# Cache open file handles per file.  The file handle will
# keep track of the position in the file, advancing each time
# that we call read().
my %fileToFH;

sub readN($s, $n)
{
    my $fh;
    if ( exists $fileToFH{$s} )
    {
        $fh = $fileToFH{$s};
    }
    elsif ( open($fh, "<:utf8", $s) )
    {
        $fileToFH{$s} = $fh;
    }
    else
    {
        die "Invalid filename $s ($!)";
    }
    my $howmany = read($fh, my $bytes, $n);
    return $bytes;
}
binmode(STDOUT, "utf8");
say readN($FILE, $N);
say readN($FILE, $N);
say readN($FILE, $N);
