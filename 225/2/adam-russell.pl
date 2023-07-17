#!/usr/bin/env perl
use v5.36;

sub left_right_sum{
    return unpack("%32I*", pack("I*", @_));
}

sub left_right_differences{
    my(@left_sum, @right_sum);
    for(my $i = 0; $i < @_; $i++){
        push @left_sum, left_right_sum(@_[0 .. $i - 1]);
        push @right_sum, left_right_sum(@_[$i + 1 .. @_ - 1]);
    }    
    return map { abs($left_sum[$_] - $right_sum[$_]) } 0 .. @_ - 1;
}

MAIN:{
    say join(q/, /, left_right_differences 10, 4, 8, 3);
    say join(q/, /, left_right_differences 1);
    say join(q/, /, left_right_differences 1, 2, 3, 4, 5);
}
