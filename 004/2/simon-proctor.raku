#!/usr/bin/env raku

subset FilePath of Str where *.IO.f;

sub MAIN (
    FilePath $dict = 'words', #= Dictionary file to read
    @letters = <c r a t e>
) {
    my $check-set = bag( @letters.map( *.lc ) );

    $dict.IO.words.grep( { bag( $_.lc.comb ) (<=) $check-set } )>>.say;
}

