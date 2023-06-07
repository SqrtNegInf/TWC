#!/usr/bin/env perl
use v5.36;

my ($S, $C, $O) = ('perlandraku', 3, 4);
my $N = length($S);

die "Invalid arguments given"
  unless ($C >= 1 and 
          $O >= 1 and 
          $C <= $O and 
          $C +$O <= $N and
          $C <= $O);

printf q{
Input:
  $S = '%s'
  $C = %d
  $O = %d 

}, $S, $C, $O;

my $s = characterSwapping($S, $C, $O);

print qq{
Output:
  $s
};


sub characterSwapping {
  my ($S, $C, $O) = @_;

  my @s = split(//, $S);

  print "Character Swapping:\n";

  foreach my $i (1 .. $C) {
    my @i = ($i % $N, ($i + $O) % $N);

    print "  swap: $s[$i[0]] <=> $s[$i[1]] = ";

    @s[@i] = @s[reverse @i];

    print join('', @s)."\n";
  }

  return join('', @s);
}
