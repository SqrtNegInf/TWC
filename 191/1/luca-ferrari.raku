#!/usr/bin/env raku

sub MAIN( @l where { @l.grep( * ~~ Int ).elems == @l.elems }  = (2,6,3,1) ) {
    my $max = @l.max;
    my @ll = @l.grep: { $_ == $max ||  $_ * 2 <= $max };
    '1'.say and exit if @ll.elems == @l.elems;
    '-1'.say;
}
