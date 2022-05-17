#!/usr/bin/env raku

sub is-happy(Int $_ is copy) {
    my @digit; # array of digits for current number
    my %seen; # have we seen this number before?
    loop {
    	$_ = ((@digit = .split('')) <<*>> @digit).sum;
    	$_ == 1 and return True;
    	%seen{$_} and return False;
    	%seen{$_} = True;
    }
}

(1..*).grep({.&is-happy}).head(8).join(' ').say
