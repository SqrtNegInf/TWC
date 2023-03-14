#!/usr/bin/env raku

sub KbWd {my @wrdz = @_;my @rwdz = ();my @rowz = ({}, {}, {});
  for (split('', 'qwertyuiop', :skip-empty)) { @rowz[0]{$_} = 1; }
  for (split('', 'asdfghjkl' , :skip-empty)) { @rowz[1]{$_} = 1; }
  for (split('', 'zxcvbnm'   , :skip-empty)) { @rowz[2]{$_} = 1; }
  for (@wrdz) {my @lcwd = split('', lc($_), :skip-empty);my $airf = 0;
    for 0..2 -> $rown {
      if     (  @rowz[$rown]{@lcwd[0]}:exists ) { $airf = 1;
        for @lcwd -> $letr { # loop thru all of @LowerCasedWorD
          if (!(@rowz[$rown]{$letr   }:exists)) { $airf = 0; last; }
        } # clear AllInRowFlag if any letter is not in the same row
      }
    }
    if ($airf) { push(@rwdz, $_); }
  }
  printf(             "(\"%s\") => ", join('","', @wrdz));
  if (@rwdz) { printf("(\"%s\");\n" , join('","', @rwdz)); }
  else       { say "();"; }
  return(@rwdz);
}
if    (@*ARGS) {
  KbWd(@*ARGS);
} else {
  KbWd("Hello","Alaska","Dad","Peace"); # => ("Alaska","Dad");
  KbWd("OMG","Bye"                   ); # => ("");
}
