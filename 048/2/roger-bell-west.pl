#!/usr/bin/env perl
use v5.36;

use POSIX qw(strftime);

my $format='%m%d%Y';

foreach my $d (10957..376199) {
  my $u=strftime($format,gmtime($d*86400));
  if ((scalar reverse $u) eq $u) {
    print "$u\n";
  }
}
