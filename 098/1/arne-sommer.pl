#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $file  = 'input.txt';
my $size  = 4;
my $times = 3;

GetOptions("file=s"  => \$file,
           "size=i"  => \$size,
	   "times=i" => \$times);

die "Not a file: " unless -f $file && -r $file;

say readN($file, $size) for 1 .. $times;

sub readN ($FILE, $number)
{
  state %handle;

  open($handle{$FILE}, "<", $FILE) unless $handle{$FILE};

  my $string;
  read $handle{$FILE}, $string, $number;
  return $string;
}
