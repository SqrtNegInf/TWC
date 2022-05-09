#!/usr/bin/env raku

#use lib 'lib';
#use Anagrams;


#unit package Anagrams;

#sub normal ( Str \word ) is pure {
#    samemark( lc( word ), "a" )
#}

sub order-string ( Str \word ) is export is pure {
    word.lc.comb.sort( { $^a cmp $^b } ).join;
    #normal( word ).comb.sort( { $^a cmp $^b } ).join;
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

#| Find the strings(s) which has the most anagrams in the given dictionary
#| Prints out 1 string per line to STDOUT
multi sub MAIN (
    FilePath :$dict = 'words'
) {
    my %store;
    my $max-length = 0;
    my @values;

    for $dict.IO.words -> $word {
        my $string = order-string( $word );
        my @keys = $string.comb;
        my $current = %store;
        for @keys -> $key {
            $current{$key} //= {};
            $current = $current{$key};
        }
        $current<count>++;
        
        given $current<count> {
            when * > $max-length {
                $max-length = $current<count>;
                @values = [$string];
            }
            when * == $max-length {
                @values.push($string);
            }
        }
        
    }

    @values>>.say;
}
