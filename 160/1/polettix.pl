#!/usr/bin/env perl
use v5.36;

my $n = shift // 7;
say four_is_magic($n);

sub four_is_magic ($n) {
   state $ints = [qw< zero one two three four five six seven eight nine >];
   my $current = $ints->[$n];
   my @seq;
   while ($n != 4) {
      $n = length $current;
      (my $previous, $current) = ($current, $ints->[$n]);
      push @seq, "$previous is $current";
   }
   push @seq, 'four is magic.';
   $seq[0] = ucfirst $seq[0];
   return join ', ', @seq;
}
