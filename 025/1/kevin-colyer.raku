#!/usr/bin/env raku

use Test;

my @pokemons =  <audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;

# NOTE - assigning porygon2n to porygon2

my %pokeIndex= @pokemons.map: *.substr(0,1) => [];
%pokeIndex{$_.substr(0,1)}.push($_ => $_.substr(*-1,1)) for @pokemons;

my Int $iterations=0;
my Str $longestChain;
my Int $longestChainLength=0;

my Int %candidates;
%candidates{@pokemons}= 1 xx @pokemons ;

for @pokemons -> $p {
    my ($l,$c) = RecursivePokeSeqence($p);
    if $l>$longestChainLength {
        $longestChainLength=$l;
        $longestChain=$c;
    }
    say "Longest sequence is $longestChainLength ---> [{$longestChain.subst("porygon2n","porygon")}]";
}
#say "Found in $iterations iterations and " ~ (now - BEGIN now) ~ " seconds";


sub RecursivePokeSeqence($pokemon) {
    return 0 , "" if  %candidates{$pokemon}==0; # This pokemon has already been used
    return $pokemon.chars , $pokemon if %pokeIndex{$pokemon.substr(*-1,1)}:!exists; # return length if end does not start another pokemon

    %candidates{$pokemon}=0;# # mark pokemon as used
    $iterations++;

    my $l = 0;
    my $greatestlength=0;
    my $greatestchain="";
    my $chain;

    # find possible next candidates for endings of this pokemon
    my $ends = %pokeIndex{$pokemon.substr(*-1,1)};
    for |$ends -> $nextPokemon {
        ($l,$chain)=RecursivePokeSeqence($nextPokemon.keys[0]);
        if $l>$greatestlength {
            $greatestlength=$l;
            $greatestchain=$chain;
        }
    }
    %candidates{$pokemon}=1; # finished looking so mark as unused and return up a level

    return $pokemon.chars+$greatestlength , $pokemon~" "~$greatestchain;
}
