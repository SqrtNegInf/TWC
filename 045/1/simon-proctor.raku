#!/usr/bin/env raku

multi sub MAIN(
    @clear-text = <The quick brown fox jumps over the lazy dog>
) {
    roundrobin( @clear-text.map(*.lc.comb).flat.rotor( 8, :partial ) ).map(*.join("")).join(" ").say;
    
}


#| Given a square encoded string decode it
multi sub MAIN(
    Bool :d(:$decode)!, #= Turn on decode mode
    *@encoded #= Encoded phrase
) {
    roundrobin( @encoded.map(*.comb("")) ).flat.join("").say;
}
