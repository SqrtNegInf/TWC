#!/usr/bin/env raku
#  (2,3,3,3,5)
sub MAIN( Int $single = 2,
	  Int $double = 3,
	  @nums is copy = (3,3,5) ) {

    my $current_max = @nums.max;
    my @need_operation = @nums.grep( * < $current_max, :k );
    my $score = 0;

    while ( @need_operation ) {

	if @need_operation.elems == 1 {
	    # single operation
	    @nums[ @need_operation[ 0 ] ] += 1;
	    $score += $single;
	}
	elsif @need_operation.elems > 1 {
	    @nums[ @need_operation[ 0 ] ] += 1;
	    @nums[ @need_operation[ 1 ] ] += 1;
	    $score += $double;
	}

	@need_operation = @nums.grep( * < $current_max, :k );
    }

    $score.say;

}
