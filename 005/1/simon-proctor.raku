#!/usr/bin/env raku

#use lib 'lib';
#use Anagrams;

#unit package Anagrams;

#sub normal ( Str \word ) is pure {
#    samemark( lc( word ), "a" )
#}

sub order-string ( Str \word ) is export is pure {
    #normal( word ).comb.sort( { $^a cmp $^b } ).join;
    word.lc.comb.sort( { $^a cmp $^b } ).join;
}

multi sub is-anagram-of( Str \target, Str \word where * eq target ) is export is pure { False; }

multi sub is-anagram-of( Str \target, Str \word where *.codes != target.codes ) is export is pure { False; }

multi sub is-anagram-of( Str \target, Str \word ) is export is pure {
    #normal( target ) ne normal( word ) && order-string( target ) ~~ order-string( word );
    order-string( target ) ~~ order-string( word );
}
my %*SUB-MAIN-OPTS = :named-anywhere;

#sub USAGE { say $*USAGE }

subset FilePath of Str where *.IO.f;

#| Display Help file
#multi sub MAIN ( Bool :h($help) where *.so ) { USAGE(); }

#| Find the anagrams for a given word
multi sub MAIN (
    Str $word = 'animal', #= Word to check for. Case insensitive
    FilePath :$dict = 'words' #= Dictionary file to use. Defaults to "/etc/dictionaries-common/words"
) {
    $dict.IO.words.grep( { is-anagram-of( $word, $_ ) } )>>.say;
}
