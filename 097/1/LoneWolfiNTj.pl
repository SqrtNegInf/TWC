#!/usr/bin/env perl
use v5.36;

my $N = 13;

#exit 666 if $N !~ /^-?\d+$/;
#exit 666 if $N < -26 || $N > 26;

my @upper   = split //,'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
my @lower   = split //,'abcdefghijklmnopqrstuvwxyz';
my @strings = <Perl Rocks>;
say '';

foreach my $S (@strings)
{
   foreach my $index (0..((length $S)-1))
   {
      my $ord = ord(substr($S,$index,1));
      if ($ord >= 65 && $ord <= 90)
         {substr($S,$index,1) = $upper[($ord-65-$N)%26];}
      if ($ord >= 97 && $ord <= 122)
         {substr($S,$index,1) = $lower[($ord-97-$N)%26];}
   }
   print $S;
}
