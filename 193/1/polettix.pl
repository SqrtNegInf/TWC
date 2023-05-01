#!/usr/bin/env perl
use v5.36;
use Math::BigInt;

my $it = binary_strings_iterator(shift // 4);
while (defined(my $binary_string = $it->())) {
   say $binary_string;
}

sub binary_strings_iterator ($n) {
   my $i = Math::BigInt->bzero;
   return sub {
      return unless defined $i;
      my $raw = ($i++)->to_bin;
      my $len = length $raw;
      return $i = undef if $len > $n;
      return ('0' x ($n - $len)) . $raw;
   };
}
