#!/usr/bin/env raku

range('input.txt',3,6);

sub range($fn,$a,$b) {
  my $n=0;
  my $fh=open :r,$fn;
  for $fh.lines {
    $n++;
    if ($n > $b) {
      last;
    }
    if ($n>=$a) {
      say $_;
    }
  }
  close $fh;
}
