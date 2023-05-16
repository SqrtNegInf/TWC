#!/usr/bin/env perl
use v5.36;
use English qw< -no_match_vars >;

say "Fibonacci Words:\n";
#my $it = fibonacci_words_iterator(@ARGV);
my $it = fibonacci_words_iterator(1234, 5678);
while ('necessary') {
   my $item = $it->();
   say "'$item'";
   if (length $item >= 51) {
      my $digit = substr $item, 50, 1;
      say "\nThe 51st digit in the first term having at least 51 digits '$item' is $digit.";
      last;
   }
}

sub fibonacci_words_iterator ($f0, $f1) {
   my @cache = ('', '', $f0, $f1);
   my $backlog = 2;
   return sub {
      if (! $backlog) {
         ($f0, $f1) = ($f1, $f0 . $f1);
         return $f1;
      }
      --$backlog;
      return $backlog ? $f0 : $f1;
   };
}
