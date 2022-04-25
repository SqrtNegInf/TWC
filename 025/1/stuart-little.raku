#!/usr/bin/env raku

# sub-optimal results, but stable

my @words=<audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;

sub lgchain(@acc,$word,@words) {
    my @fewer-words=(@words (-) $word).keys.sort.grep({ $_.starts-with($word.comb.[*-1]) });
    @fewer-words == 0 && return ($word,|@acc);    
    return @fewer-words.map({ lgchain(@acc,$_,@fewer-words) }).max({ $_.elems }).map({ $word, |$_ });
}

say @words.map({ lgchain([],$_,@words) }).map(|*).max(*.elems);
