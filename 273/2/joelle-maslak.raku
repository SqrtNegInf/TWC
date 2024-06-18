#!/usr/bin/env raku

#sub MAIN(Str:D $str) {
my $str = "aabb";
    my $match = $str ~~ m/^ <-[ b ]>* 'b' <!before 'a'>/;
    say "Output: " ~ ($match ?? "true" !! " false");
#}
