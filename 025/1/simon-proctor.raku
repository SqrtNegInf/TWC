#!/usr/bin/env raku

# answer not optimal

role NodeLink {
    has Str $.target-id;
    has Str $.value;
}

role Node {
    has NodeLink %.links;
    has Str $.id;

    method link-count { @.links.elems }

    method add-link( NodeLink $link ) {
        %.links{$link.value} = $link;
    }

    method targets {
        my %out;
        for %.links.values -> $link {
            %out{$link.target-id} //= 0;
            %out{$link.target-id}++;
        }
        return %out;
    }

    method remove-link( Str $target ) {
        my $key = %.links.values.first( { $_.target-id ~~ $target } ).value;
        %.links{$key}:delete;
    }
}


multi sub MAIN(
) {
    my %nodes;
    for ($=finish).words -> $word {
        my $node-key = $word.substr(0,1);
        %nodes{$node-key} //= Node.new( :id($node-key) );
        my $link-to = $word.substr($word.codes-1,1);
        %nodes{$node-key}.add-link( NodeLink.new( :target-id($link-to), :value($word) ) );
    }
    my $current = %nodes.values.sort( { $^b.link-count <=> $^a.link-count } )[0];
    
    while $current && $current.link-count > 0 {
        my %targets = $current.targets;
        my $next = %nodes.values.sort( { $^b.link-count <=> $^a.link-count } ).first( { %targets{$_.id}:exists } );
        if $next {
            my $link = $current.remove-link( $next.id );
            say $link.value;
        }
        $current = $next;
    }
}

=finish
audino
bagon
baltoy
banette
bidoof
braviary
bronzor
carracosta
charmeleon
cresselia
croagunk
darmanitan
deino
emboar
emolga
exeggcute
gabite
girafarig
