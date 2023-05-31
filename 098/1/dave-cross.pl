#!/usr/bin/env perl
use v5.36;

say readN('input.txt', 4) for 1 .. 3;

sub readN ($filename, $n) {
  state %fh;

  unless ($fh{$filename}) {
    open $fh{$filename}, '<', $filename
      or die "Cannot open '$filename': $!\n";
  }

  read $fh{$filename}, my ($buf), $n;

  return $buf;
}
