#!/usr/bin/env raku

sub MAIN ($s = 'Raku') { put capital-detection($s) }

sub capital-detection ($string) {
   ($string ~~ /
         ^<[a..z]>*$                # lc
      |  ^<[a..z A..Z]><[a..z]>*$   # ucfirst
      |  ^<[A..Z]>*$/               # uc
   ) ?? 1 !! 0;
}
