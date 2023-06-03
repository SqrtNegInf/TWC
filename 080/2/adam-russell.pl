#!/usr/bin/env perl
use v5.36;

sub count_candies{
    my(@candidates) = @_;
    my $candies = @candidates;
    for my $i (0 .. (@candidates - 1)){
        if($candidates[$i - 1]){
            $candies++ if $candidates[$i] > $candidates[$i - 1];
        }   
        if($candidates[$i + 1]){
            $candies++ if $candidates[$i] > $candidates[$i + 1];
        }
    }
    return $candies;
}


MAIN:{
    my @N;
    my $number_candies;
    @N = (1, 2, 2);
    $number_candies = count_candies(@N);
    print "The number of candies for (" .
        join(",", @N) . ") is $number_candies\n";
    @N = (1, 4, 3, 2);
    $number_candies = count_candies(@N);
    print "The number of candies for (" .
        join(",", @N) . ") is $number_candies\n";
}
