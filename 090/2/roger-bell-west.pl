#!/usr/bin/env perl
use v5.36;

em(13,238);

sub em {
  my ($a,$b)=@_;
  my $s=0;
  my @demo;
  while ($a > 0) {
    my $line=sprintf('%5d %5d',$a,$b);
    if ($a & 1 == 1) {
      $s+=$b;
      $line .= sprintf(' -> %5d',$b);
    }
    $a >>= 1;
    $b <<= 1;
    push @demo,$line;
  }
  push @demo,'               -----';
  push @demo,sprintf('               %5d',$s);
  print map {"$_\n"} @demo;
  return $s;
}
