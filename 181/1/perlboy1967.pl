#!/usr/bin/env perl
use v5.36;

use Data::Printer;

sub reorderWords {
  my ($s) = @_;

  my @w = grep /\S/, sort { uc$a cmp uc$b || $a cmp $b } split /[\s\.]+/, $s;
  $s =~ s/([^\s\.]+)/shift@w/egsm;

  return $s;
}

sub sentenceOrder {
  my ($s) = @_;

  $s =~ s/(.+?\.)/reorderWords($1)/egsm;

  return $s;
}

my $input = q(All he could think about was how it would all end. There was
still a bit of uncertainty in the equation, but the basics
were there for anyone to see. No matter how much he tried to
see the positive, it wasn't anywhere to be seen. The end was
coming and it wasn't going to be pretty.);

print "Input:\n$input\n\n";

my $output = sentenceOrder($input);

print "Output:\n$output\n";
