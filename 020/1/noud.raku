#!/usr/bin/env raku

sub MAIN(Str $str='bookkeeper') {
    map({$_.Str.say}, $str ~~ m:g/(.)$0*/);
}
