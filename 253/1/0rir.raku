#!/usr/bin/env raku

use Test;

sub ____ (+@list) { gather @list.deepmap: *.take }   # move to Flatland 
constant \pancake-flat = &____;

my @Test =
    '@', ('one@@two@three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    ':', ("one:two:three","four:five","six"),
            Q'"one","two","three","four","five","six"',
    '.', ("one.two.three","four.five","six"),
            Q'"one","two","three","four","five","six"',
    '$', ('$perl$$', '$$raku$'),
        Q'"perl","raku"',
    '#', ('one##two#three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    '%', ('one%%two%three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    '^', ('one^^two^three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    '&', ('one&&two&three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    '*', ('one**two*three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    '(', ('one((two((three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    ')', ('one))two)three','four$five',"six"),
            Q'"one","two","three","four$five","six"',
    '?', ('one??two?three','four$five',"six"),
            Q'"one","two","three","four$five","six"',

                                            #   Q'one\\two' ; is confused.

#    Q'\', ( Q{one\\two\three}, Q{four$five}, "six"),   # this will work
#           Q'"one","two","three","four$five","six"',

                                                        # but punted these
#   Q'\', ( Q{one\\two\three}, Q{four\$five}, "six"),
#           Q'"one","two","three","four$five","six"',
#   Q'\', ( Q{one\\two\three}, Q{four\\$five}, "six"),
#           Q'"one","two","three","four$five","six"',
#   Q'\', ( Q{one\\two\three}, Q{four\\\$five}, "six"),
#           Q'"one","two","three","four$five","six"',
#   Q'\', ( Q{one\\two\three}, Q{four\\\\$five}, "six"),
#           Q'"one","two","three","four$five","six"',
;
plan @Test ÷ 3;

sub func( $sep where * ne Q{\}, @word --> Str) {
    # more efficient to be taught how to normalize backslash than self learning?
    '"'
    ~ @word.map( *.split( / $sep+ / , :skip-empty )
               ).&____.join( '","').grep( none "")
    ~ '"'
}

for @Test -> $sep, @in, $exp {
    is func($sep, @in), $exp, "$exp <- $sep <- @in[]";
}
done-testing;
my $sep = 'x';
my @word = Q{??xxx!!x##X#@@x^}, Q{^x&x*x(x)x-x+x=[x;]'x/x\x|x<x>x_x};


print "\nInput: @word = ( @word[] )\n       \$separator = "
    ~ $sep ~ "\nOutput: ", func( $sep, @word);

die unless  func( $sep, @word) ~~ Q{"??","!!","##X#@@","^","^","&","*","(",")","-","+","=[",";]'","/","\","|","<",">","_"};
exit;

