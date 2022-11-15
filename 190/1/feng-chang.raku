#!/usr/bin/env raku

unit sub MAIN(Str:D \s = 'Raku');
put +so s eq s.lc.tc|s.lc|s.uc;
