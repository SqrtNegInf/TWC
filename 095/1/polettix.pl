#!/usr/bin/env perl
use v5.36;

sub is_palindrome ($s) {
   for my $i (0 .. length($s) / 2 - 1) {
      return 0 if substr($s, $i, 1) ne substr($s, -1 - $i, 1);
   }
   return 1;
}

sub palindrome_number ($N) { return is_palindrome($N) }

say palindrome_number(shift || 1221);
