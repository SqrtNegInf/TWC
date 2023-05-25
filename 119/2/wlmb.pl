#!/usr/bin/env perl
use v5.36;

#use integer;

map {say "Input: $_, Output: ", get($_)} <5 10 60>;
sub get {
    my $want=shift;
    my $r="1";
    $r=increment($r) while($r=~/11/ || --$want > 0);
    $r;
}
sub increment {
    my $r=shift;
    while(1){
	$r=~/(.*)(.)$/;
	my $high=$1||0;
	my $low=$2+1;
	return $low>3?increment($high)."1":$high?$high.$low:$low;
    }
}
