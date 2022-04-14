#!/usr/bin/env raku

use Test;


#multi MAIN(Str $plaintext) {
#    squareSecretEncode($plaintext).say
#}

#multi MAIN('test') {
    is squareSecretEncode("The quick brown fox jumps over the lazy dog"),"tbjrd hruto eomhg qwpe unsl ifoa covz kxey","Encodes correctly";
    done-testing;
#}

sub squareSecretEncode(Str $plaintext) returns Str {
    # transform to lowercase a-z only and remove spaces then split
    my @t=$plaintext.lc.trans(['a'..'z'] => '', :complement).comb;
    # calculate the rows in the 8x? grid
    my $rows=(@t.elems + 8) div 8;

    # gather the ciphered text - go over entire grid even though it may not fill entirely
    my @c=gather for ^$rows*8 -> $i {
        # transform the left to right array traversal to a down first then along
        #      DOWN             ALONG
        my $j=($i % $rows)*8  + $i div $rows;

        # if we are over the end of the array take a space and loop
        # could avoid this code if we add 8 spaces to end of array...
        if $j>=@t.elems {
            take " ";
            next
        };

        # take the element at the translated position
        take @t[$j];
    }
    # make a string from @c using rotor to combine every 5 elements (or less at end)...
    # join the new list of 5 elems to a string...
    # as the new string might have a space split on words and re-join with single space
    ~@c.rotor(5,:partial)>>.join>>.words>>.join(" ");
}
