#!/usr/bin/env raku

use Test;

#multi MAIN( Str $text) { say expand($text.words).join: "\n"; }

sub expand(*@texts) {
    my @expanded;
    for @texts -> $t {
        if $t.starts-with: '{' and $t.ends-with: '}' {
             @expanded.push: [ $t.substr(1,*-1).split(',') ];
        } else {
            @expanded.push:  [ $t ];
        }
    }
    # reduce array using cross multiplier
    return [X] @expanded;
}

#multi MAIN('test') {
 is expand( <a> ),'a',"one level";
 is expand(('a','b')),('a','b'),"two level";
 is expand(('{a,c}','b')),(('a','b'),('c','b')),"two level";
 is expand( <p {d,w,m,y} c> ),(<p d c>,<p w c>,<p m c>,<p y c>),"example";

#}
