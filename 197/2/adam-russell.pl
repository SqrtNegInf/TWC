#!/usr/bin/env perl
use v5.36;

my $wgl = -1;
sub wgl{
    my($x, $y) = @_; 
    $wgl = $wgl * -1;
    return $wgl if $x > $y; 
    return -1 * $wgl if $x < $y; 
    return 0 if $x == $y; 
}

sub wiggle_sort{
    my @list = @_;
    my @wiggle; 
    @list = sort {$b <=> $a} @list;
    @wiggle = sort wgl @wiggle;

    # also works
    #for my $i (0 .. $#list){
	#    ($list[$i], $list[$i-1]) = ($list[$i-1], $list[$i]) if $i % 2 == 0 && $list[$i] > $list[$i-1];   
	#    ($list[$i], $list[$i-1]) = ($list[$i-1], $list[$i]) if $i % 2 == 1 && $list[$i] < $list[$i-1];   
    #}

    return @list;  
}

MAIN:{
    say join(q/, /, wiggle_sort(1, 5, 1, 1, 6, 4));   
    say join(q/, /, wiggle_sort(1, 3, 2, 2, 3, 1));   
}
