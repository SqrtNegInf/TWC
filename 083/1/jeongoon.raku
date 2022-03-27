#!/usr/bin/env raku
sub  MAIN ( Str \S = 'Markmið lífs okkar er að vera hamingjusöm' ) {
    S
    ==> words()         # task allow us ignore whitespace so it's safe
    ==> my @W;
    @W[ 1 .. * -2 ]     # no check but task will give us at least 3 words
    ==> join("")
    ==> chars()
    ==> my @A;           # captured value is always a sequences
    #$*ERR.say( "Words: {@W.raku}" );
    say @A[0];           # so we have to .[0]

    # of-course-this-is-shorter
    say S.words.[ 1 .. *-2 ].join("").chars;
}

