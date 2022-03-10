#!/usr/bin/env raku

# run <script> <space-separated digits>

my $attemptedOut = S/(.)(<[13579]>*)$/$1$0/ with (4, 1, 7, 6).sort({ $^b leg $^a }).join("");
say(($attemptedOut ~~ m/<[02468]>$/) ?? ($attemptedOut) !! ("No even digits.."));

