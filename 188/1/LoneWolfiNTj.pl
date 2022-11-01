#!/usr/bin/env perl

# NOTE: Input is via command-line arguments, which should be
#       a space-separated list of integers followed by a divisor.

# NOTE: Output is to stdout and will be a non-negative integer giving
#       "number of pairs whose sum is divisible by divisor".

use v5.36;
my @ARGV = (4, 5, 1, 6, 2);
die if scalar(@ARGV) < 3;     # Must have at least 2 items & divisor.
my $k = splice(@ARGV, -1, 1); # Slice $k off of right end of @ARGV.
my $count = 0;                # Start with count = 0.
for ( my $i = 0 ; $i <= $#ARGV - 1 ; ++$i )        # for each first item
{
   for ( my $j = $i + 1 ; $j <= $#ARGV ; ++$j )    # for each second item
   {
      ++$count if 0 == ($ARGV[$i]+$ARGV[$j]) % $k; # sum is divisible?
   }
}
say $count;
exit;
__END__
