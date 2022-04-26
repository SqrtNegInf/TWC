#!/usr/bin/env raku


sub MAIN( Str $keyword where *.chars > 0 = 'one') {
    my %index = build_inverse_index( get_documents() );
    my @matches = %index{ $keyword.lc }:v.sort( { .<freq> } ).reverse;
    say "Found @matches.elems() document(s) for '$keyword.lc()'";
    say "* '$_.<doc>': $_.<freq> occurrence(s)" for @matches;
}


sub build_inverse_index( %documents ) {
    my %index;

    for %documents.kv -> $name, $text {
        my $bag = bag $text.lc.words;
        for $bag.kv -> $word, $freq {
            %index{ $word }.push: %( doc => $name, freq => $freq );
        }
    }

    return %index;
}


sub get_documents {
    return %(
        'Pride and Prejudice' => q:to/TXT/,
            It is a truth universally acknowledged, that
            a single man in possession of a good fortune
            must be in want of a wife. However little
            known the feelings or views of such a man may
            be on his first entering a neighbourhood,
            this truth is so well fixed in the minds of
            the surrounding families, that he is
            considered the rightful property of some one
            or other of their daughters.
            TXT
        'War of the Worlds' => q:to/TXT/,
            No one would have believed, in the last years
            of the nineteenth century, that human affairs
            were being watched from the timeless worlds
            of space. No one could have dreamed that we
            were being scrutinised as someone with a
            microscope studies creatures that swarm and
            multiply in a drop of water. And yet, across
            the gulf of space, minds immeasurably
            superior to ours regarded this Earth with
            envious eyes, and slowly, and surely, they
            drew their plans against us...
            TXT
        'Richard III' => q:to/TXT/,
            Now is the winter of our discontent made
            glorious summer by this sun of York; and
            all the clouds that lour'd upon our
            house in the deep bosom of the ocean
            buried. Now are our brows bound with
            victorious wreaths; our bruised arms
            hung up for monuments; our stern
            alarums changed to merry meetings, our
            dreadful marches to delightful
            measures.
            TXT
        "Hitchhiker's Guide to the Galaxy" => q:to/TXT/,
            Far back in the mists of ancient
            time, in the great and glorious days
            of the former Galactic Empire, life
            was wild, rich and largely tax free.
            TXT
    );
}
