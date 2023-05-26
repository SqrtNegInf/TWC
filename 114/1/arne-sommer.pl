#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $verbose = 0;

GetOptions("verbose"  => \$verbose);

my $N = $ARGV[0] // 1234;

die "Not a positive integer" unless $N =~ /^[1-9]\d*$/;

while ($N++)
{
  say ": Candidate $N" if $verbose;

  if ($N eq reverse($N))
  {
    say $N;
    exit;
  }
}
