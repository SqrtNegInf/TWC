#!/usr/bin/env perl
use v5.36;

my $N = $ARGV[0] // 10;

die "Postive number only" unless $N =~ /^[1-9]\d+$/;

say int_sqare_root($N);

sub int_sqare_root ($number)
{
  my $x0 = $number >> 1;

  if ($x0)
  {
    my $x1 = ( $x0 + $number / $x0 ) >> 1;
		
    while ($x1 < $x0)
    {
      $x0 = $x1;
      $x1 = ( $x0 + $number / $x0 ) >> 1;
    }
    return $x0;
  }
  else
  {
    return $number;
  }
}
