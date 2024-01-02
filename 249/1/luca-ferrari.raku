#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems %% 2 && @nums.grep( * ~~ Int ).elems == @nums.elems } ) {
my @nums = (3,2,3,2,2,2);

    my %pair-elements;
    %pair-elements{ $_ }++ for @nums;
    my @pairs;
    for %pair-elements.keys.sort {
	my $how-many-pairs = %pair-elements{ $_ } / 2;
	next if $how-many-pairs < 1;
	@pairs.push: [ $_, $_ ] while ( $how-many-pairs-- > 1 );
    }

    @pairs.join( ", " ).say;
#}
