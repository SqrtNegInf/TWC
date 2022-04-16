#!/usr/bin/env raku

my $ll:=(
    <I L O V E Y O U>,
    <2 4 0 3 2 0 1 9>,
    <! ? £ $ % ^ & *>,
);

for $ll.&roundrobin {.say}
