#!/usr/bin/env raku

sub MAIN() {
    my @first = < Perl Raku PHP Love >;
    my @second = < Raku Perl Hate >;
    my %results;

    for 0 ..^ @first.elems {
	%results{ $_ + @second.first( @first[ $_  ], :k ) }.push: @first[ $_ ] if ( @second.grep: @first[ $_ ] );
    }

    %results{ %results.keys.min }.join( ',' ).say;
}
