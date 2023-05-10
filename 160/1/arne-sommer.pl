#!/usr/bin/env perl
use v5.36;

my $n = $ARGV[0] || "5";

die "Values 1..9 only" unless $n =~ /^[1-9]$/;

my @names =
(
  "zero",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine"
);

my @result;

do
{
  my $text   = $names[$n];
  my $length = length($text);

  push(@result, "$text is $names[$length]");
  $n = $length;
} while $n != 4;

say ucfirst(join(", ", @result)) . ", four is magic.";
