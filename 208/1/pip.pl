#!/usr/bin/env perl
use v5.36;

sub MInS {my @lst2 = @_;my @lst1 = ();my @mins = ();my @nsmz = ();my %ndxs = ();
  while ($lst2[0] ne ';') {
    push(@lst1,             shift(@lst2));
  }; if ($lst2[0] eq ';') { shift(@lst2) ; } # remove the semicolon separator
  for   my $ndx1 (0..$#lst1) {
    for my $ndx2 (0..$#lst2) {
      if ($lst1[$ndx1] eq $lst2[$ndx2]) {
        push(@{$ndxs{ $ndx1 + $ndx2 }}, $lst1[$ndx1]);
      }
    }
  }
  @nsmz = sort { $a <=> $b } keys(%ndxs);
  @mins = @{$ndxs{$nsmz[0]}} if  (@nsmz);
  printf(                "(\"%s\") ,\n", join('","', @lst1));
  printf(                "(\"%s\") => ", join('","', @lst2));
  if    (@mins) { printf("(\"%s\");\n" , join('","', @mins)); }
  else          { say    "();"; }
  return(@mins);
}
if    (@ARGV) {
  MInS(@ARGV);
} else {
  MInS("Perl","Raku","Love",";",   # I've decided to use a single semicolon to separate the 2 input lists of strings.
       "Raku","Perl","Hate"     ); # => ("Perl","Raku");
  MInS("A","B","C",";",
       "D","E","F"              ); # => ();
  MInS("A","B","C",";",
       "C","A","B"              ); # => ("A");
}
