#!/usr/bin/env perl
use v5.36;

use List::Util qw(min max);

sub neither {
    my($min,$max)=(min(@_),max(@_));
    grep { $_!=$min and $_!=$max } @_;
}

sub neither_faster { #faster for large lists, but requires exstra install
    require List::MoreUtils;
    my($min,$max)=List::MoreUtils::minmax(@_);
    grep { $_!=$min and $_!=$max } @_;
}


    for(
	[ [ 3,2,4,5,1] => [3,2,4] ],
	[ [ 10..19] => [11..18] ]
    ){
	my($input,$expected)=@$_;
	my @got=neither(@$input);
	print "@got" eq "@$expected" ? 'ok' : '***NOT OK';
	print "   input: @$input    expected: @$expected    got: @got\n";
    }
