#!/usr/bin/env perl
use v5.36;

sub move_zeroes{
    my @list = @_;
    my @zeroes;
    my @non_zeroes;
    {
        my $x = shift @list; 
        push @list, $x; 
        push @zeroes, $x if $x == 0;
	push @non_zeroes, $x if $x != 0;
        redo unless @zeroes + @non_zeroes == @list;
    }
    return (@non_zeroes, @zeroes);
}

MAIN:{
    say join(q/, /, move_zeroes(1, 0, 3, 0, 0, 5));    
    say join(q/, /, move_zeroes(1, 6, 4));    
    say join(q/, /, move_zeroes(0, 1, 0, 2, 0));    
}
