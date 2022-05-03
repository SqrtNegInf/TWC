#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

sub makeCheckDigit {
  my $n = shift;

  my @arr = split(//,$n);
  my $evensum = $arr[0] + $arr[2] + $arr[4] + $arr[6] + $arr[8] + $arr[10];
  my $oddsum = ($arr[1] + $arr[3] + $arr[5] + $arr[7] + $arr[9] + $arr[11]) * 3;
  my $presum = ($evensum + $oddsum) % 10;
  my $checkdigit = 10 - $presum;

  return $checkdigit;
}

my $isbn = '978-0-306-40615-7';
my $num = substr($isbn,0,15);
$num =~ tr/\-//d;
my $checkdigit = makeCheckDigit($num);

say "ISBN-13 check digit for $isbn is $checkdigit.";
