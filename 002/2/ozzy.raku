#!/usr/bin/env raku

my Str $a = '123'; # prompt("\nPlease, give me a decimal (base-10) number : ");
say("$a in decimal notation is { $a.Int.base(35) } in base-35 notation.");
