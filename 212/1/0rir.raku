#!/usr/bin/env raku

use Test;

my @Test =
    'Perl',     (2,22,19,9),    'Raku',
    'vWxYz',    (5,5,5,5,5),    'aBcDe',
    'abc',      (1,2,3),        'bdf',
;
plan @Test ÷ 3;

class Rot-n {
    has Any $.abc is required; # a ring-table of the alphabet in use
    has Int $!elems;    # of $.abc
    has Any %!index;    # kv,s of abc

    method key-of( $char ) { %!index{$char.lc} }
    method val-of( UInt $idx ) {  $!abc[$idx % $!elems];}

    method new( @alphabet){ ::?CLASS.Mu::new( abc => @alphabet ); }
    method TWEAK { $!elems = $!abc.elems; %!index = $!abc.antipairs; }

    # rotate each char in $in by zip sister in @offset
    method rot-n( Str $in, @offset where *.elems == $in.chars -->Str) {
        my Str @orig = [$in.comb];
        my @return =  @orig;
        for ^@return -> $i {
            @return[$i] = $.val-of( $.key-of(@return[$i]) + @offset[ $i]);
            @return[$i] = @orig[$i] eq @orig[$i].uc
                          ??           @return[$i].uc
                          !!           @return[$i];
        }
        return @return.join;
}   }


my Rot-n $r = Rot-n.new( 'a'...'z' );

for @Test -> $in, @offset, $exp {
    is $r.rot-n( $in, @offset), $exp,  "$in --> $exp";
}
done-testing;


my $word = 'Perl';
my @jump = (2,22,19,9);

say "\nInput: $word = 'Perl' and @jump = @jump.raku()
Output: $r.rot-n($word, @jump)";
