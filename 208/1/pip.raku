#!/usr/bin/env raku

sub MInS {my @lst2 = @_;my @lst1 = ();my @mins = ();my @nsmz = ();my %ndxs = ();
  while (@lst2[0] ne ';') {
    push(@lst1,             shift(@lst2));
  }; if (@lst2[0] eq ';') { shift(@lst2) ; } # remove the semicolon separator
  for   (0..(@lst1.elems-1)) -> $ndx1 {
    for (0..(@lst2.elems-1)) -> $ndx2 {
      if (@lst1[$ndx1] eq @lst2[$ndx2]) {
        %ndxs{  $ndx1 + $ndx2 }.push(@lst1[$ndx1]);
      }
    }
  }
  @nsmz = sort +*, keys(%ndxs);
  @mins = %ndxs{@nsmz[0]}[] if (@nsmz);
  printf(                "(\"%s\") ,\n", join('","', @lst1));
  printf(                "(\"%s\") => ", join('","', @lst2));
  if    (@mins) { printf("(\"%s\");\n" , join('","', @mins)); }
  else          { say    "();"; }
  return(@mins);
}
if    (@*ARGS) {
  MInS(@*ARGS);
} else {
  MInS("Perl","Raku","Love",";",   # I've decided to use a single semicolon to separate the 2 input lists of strings.
       "Raku","Perl","Hate"     ); # => ("Perl","Raku");
  MInS("A","B","C",";",
       "D","E","F"              ); # => ();
  MInS("A","B","C",";",
       "C","A","B"              ); # => ("A");
}
