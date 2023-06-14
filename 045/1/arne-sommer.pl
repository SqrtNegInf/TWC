#!/usr/bin/env perl
use v5.36;

my $string = $ARGV[0] || "The quick brown fox jumps over the lazy dog";

$string =~ tr/ //d;

my @a = split(//, lc $string);

shift @a;  # @a.shift was copied from Raku code...
pop   @a;

for my $word (0 .. 7)
{
  my $index = $word;
  while (1)
  {
    defined $a[$index]
      ? print $a[$index]
      : print(" ") && last;

   $index += 8;
  }
}

print "\n";
