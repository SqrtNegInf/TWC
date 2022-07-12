#!/usr/bin/env raku

use Test;

is five-number-summary([0,0,1,2,63,61,27,13]), [0,0.5,7.5,44,63];

done-testing;

#
#
# METHODS

sub median(@n) {
    return (@n[(@n.elems/2)-1] + @n[@n.elems/2]) / 2 if @n.elems %% 2;
    return @n[(@n.elems)/2];
}

sub five-number-summary(@n) {
    @n = sort @n;

    my $min = @n.first;
    my $max = @n.tail;
    my $med = median @n;
    my $q1  = median @n.grep: { $_ < $med };
    my $q3  = median @n.grep: { $_ > $med };

    return [ $min, $q1, $med, $q3, $max ];
}
