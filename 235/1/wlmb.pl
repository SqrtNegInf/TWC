#!/usr/bin/env perl
use v5.36;

sub test(@in) {
    # Removing one element from a one or two element array yields an
    # empty or a one element trivially sorted array
    return 1 if @in<=2;
    my $count=0;
    my @sorted;
    push @sorted, shift @in;        # initialize
    while(@in){
	if($in[0]>$sorted[-1]){     # can move from @in to @sorted
			            # without disordering it?
	    push @sorted, shift @in;
	}else{                      # if not
	    $sorted[-1]=shift(@in); # replace last element of @sorted
	    ++$count;

	    return 0
		if $count>=2        # fail if too many replacements or
                                    # if @sorted is not actually ordered
		|| (@sorted>=2 && $sorted[-2] >= $sorted[-1]);
	}
    }return 1;                      # success
}
my @in=(0, 2, 9, 4, 6);
my $out=test(@in)?"True":"False";
say "@in -> $out";
