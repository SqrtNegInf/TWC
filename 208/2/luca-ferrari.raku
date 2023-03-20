#!/usr/bin/env raku

sub MAIN( @list where { @list.grep( * ~~ Int ).elems == @list.elems } = <1 2 2 4> ) {
    my %results;

    for @list.min .. @list.max {
	%results{ $_ } += @list.grep( $_ ).elems;
    }


    for %results.keys.sort {
	"Duplicated value $_ (found { %results{ $_ } } times)".say if ( %results{ $_ } > 1 );
	"Missing value $_".say if ( %results{ $_ } == 0 );
    }
}
