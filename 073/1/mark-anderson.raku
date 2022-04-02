#!/usr/bin/env raku
unit sub MAIN($S = 3, @A =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8));

@A.rotor($S => -($S-1)).map(*.min).join(", ").List.say;
