#!/usr/bin/env raku

our sub solution(@input) is export {
    my %graph = @input.pairs;
    my $cycles = 0;

    while %graph.keys.elems {
        
        $cycles = $cycles + %graph.grep( -> $entry {$entry.key == $entry.value} );

        %graph = %graph.grep( -> $entry {$entry.key != $entry.value} );        

        my $untouched = %graph.keys.Set;

        for %graph.kv -> $k, $v {
            if %graph{$v}:exists {
                %graph{$k} = %graph{$v};
                $untouched = $untouched ∖ $k;
            }
        }

        %graph{$_}:delete for $untouched.keys;
    }

    return $cycles;
}

say solution ( (4,6,3,8,15,0,13,18,7,16,14,19,17,5,11,1,12,2,9,10) );
