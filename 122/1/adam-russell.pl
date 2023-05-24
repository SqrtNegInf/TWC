#!/usr/bin/env perl
use v5.36;

sub moving_average{
    my $n = 0; 
    my $sum = 0; 
    {
        $n += 1;
        $sum += shift; 
        print $sum / $n; 
        print ", " if @_;
        redo if @_; 
    } 
    print "\n";  
}


MAIN:{
    my @N;
    for(my $i = 10; $i < 200; $i += 10){
        push @N, $i; 
    } 
    moving_average(@N);
}
