#!/usr/bin/env raku

sub words-length ( $s ) {
    $s.words[0 ^..^ *-1]».chars.sum
}


#multi MAIN ( Bool :$test! ) {
    use Test;
    is words-length('The weekly challange'), 6;
    is words-length('The purpose of our lives is to be happy'), 23;
    is words-length('Markmið lífs okkar er að vera hamingjusöm'), 17;
    done-testing;
#}

#multi MAIN () { say slurp.&words-length }
