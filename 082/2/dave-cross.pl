#!/usr/bin/env perl
use v5.36;

my ($bit1, $bit2, $result) = ('XXY', 'XXZ', 'XXXXZY');

my $done;

for (0 .. length $bit1) {
  my $foo = $bit1;
  substr($foo, $_, 0, $bit2);
  if ($foo eq $result) {
    $done = 1;
    last;
  }
}

say $done ? 1 : 0;
