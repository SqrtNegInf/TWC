#! /usr/bin/env raku

my ($x1, $y1, $x2, $y2, $x3, $y3, $x4, $y4) = 12,24, 16,10, 20,12, 18,16;

  my $l12 = (($x2 - $x1).abs ** 2 + ($y2 - $y1).abs ** 2).sqrt;
  my $l23 = (($x3 - $x2).abs ** 2 + ($y3 - $y2).abs ** 2).sqrt;
  my $l34 = (($x4 - $x3).abs ** 2 + ($y4 - $y3).abs ** 2).sqrt;
  my $l41 = (($x1 - $x4).abs ** 2 + ($y1 - $y4).abs ** 2).sqrt;

  unless $l12 == $l23 == $l34 == $l41
  {
    say ": The four edges does not have the same length ($l12, $l23, $l34, $l41)";
    say 0;
    exit;
  }

  if $l12 == 0
  {
    say ": All the points have the same position";
    say 0;
    exit;
  }

  my $dot-product = ($x2 - $x1) * ($y2 - $y1) + ($x4 - $x1) * ($y4 - $y1);

  if $dot-product
  {
    say ": Not 90 Degrees between lines 1-2 and 1-4";
    say 0;
    exit;
  }

  if $x1 == $x3 && $y1 == $y3
  {
    say ": Point 1 and 3 are equal";
    say 0;
    exit;
  }

  say 1;
