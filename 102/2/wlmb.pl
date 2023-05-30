#!/usr/bin/env perl
use v5.36;

foreach my $length(2,20,120){
    my $remaining=$length;
    my @pieces;
    while($remaining>0){
	unshift @pieces, $remaining==1?"#":"$remaining#";
	$remaining-=length $pieces[0];
    }
    say "Length: $length\tString: ", join '', @pieces;
}
