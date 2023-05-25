#!/usr/bin/env perl
use v5.36;

use Bit::Manip 'bit_bin';

my ($n)   = 99 =~ /^([1-9][0-9]*)$/ or die "Argument must be positive int\n";
my $bin   = bit_bin ($n);
my $ispal = reverse ($bin) eq $bin ? 1 : 0;

print "$ispal as binary representation of $n is $bin which is "
  . ($ispal ? '' : 'NOT ')
  . "a palindrome.\n";
