#!/usr/bin/env raku

sub MAIN( Int:D :$limit = 20 ) {

    my @found;
    for 100 .. Inf {
        $_ ~~ / ^ $<first>=\d \d+ $<last>=\d $ /;
        my $divisor = ( $/<first> ~ $/<last> ).Int;
        @found.push: $divisor if $_ %% $divisor && ! @found.grep: { $_ == $divisor };
        last if @found.elems == $limit;
    }

    "Here it is what I found, first $limit Gapful Numbers:\n".say;
    @found.sort.join( "\n\t" ).say;
}
