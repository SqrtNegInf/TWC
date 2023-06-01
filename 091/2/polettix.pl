#!/usr/bin/env perl
use v5.36;

sub jump_game ($N) {
   my $position = 0;
   $position += $N->[$position] while $position < $#$N && $N->[$position];
   return $position == $#$N ? 1 : 0;
}

my @sequence = @ARGV ? @ARGV : (1, 2, 1, 2);
say jump_game(\@sequence);
