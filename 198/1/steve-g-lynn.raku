#!/usr/bin/env raku

say &max-gap([2,5,8,1]); #2
say &max-gap([3]); #0

sub max-gap (@list) {
    my (@sorted_list) = @list.sort( {$^a <=> $^b} );
    (@list.elems <= 2) && (return 0);
    my %gaps;
        
    (0 .. @sorted_list-2).map( {%gaps{@sorted_list[$_+1]-@sorted_list[$_]}++} );
    
    
    %gaps{ ( (%gaps.keys).sort( {$^b <=> $^a} ))[0] };
}
