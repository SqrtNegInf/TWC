#!/usr/bin/env perl5.32.1

# after munging, doesn't appear to work properly

use Try::Tiny; # DH

use feature 'say';
use PDL;
use PDL::NiceSlice;

for( [1,2], [3,4], [5,6], [1,2] ){
    try {
        my $input=pdl $_;
	my $flat=$input->clump(-2);
	my $repetitions=($flat->(:,:,*1)==$flat(:,*1,:))->andover;
	my $redundant=($repetitions&($repetitions->xvals < $repetitions->yvals))->orover;
	my $keep_indices=which(!$redundant);
	say +$input->mv(-1,0)->index1d($keep_indices)->mv(0,-1);
    }
    catch { #($m) {
        say "\n$m\nInvalid ndarray: $_";
        say "Invalid ndarray: $_";
    }
}
