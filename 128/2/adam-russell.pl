#!/usr/bin/env perl
use v5.36;

use Date::Parse;
use Heap::MinMax;

sub number_platforms{
    my($arrivals, $departures) = @_;
    my $platforms = 0; 
    my $heap = Heap::MinMax->new();
    $heap->insert(str2time(shift @{$departures}));  
    for my $i (0 .. @{$departures}){
        $platforms++ if str2time($arrivals->[$i]) < $heap->min();  
        $heap->pop_min() if str2time($arrivals->[$i]) >= $heap->min();  
        $heap->insert(str2time($departures->[$i]));  
    }    
    return $platforms; 
}

MAIN:{
    print number_platforms(
        ["11:20", "14:30"],
        ["11:50", "15:00"]
    ) . "\n"; 
    print number_platforms(
        ["10:20", "11:00", "11:10", "12:20", "16:20", "19:00"],
        ["10:30", "13:20", "12:40", "12:50", "20:20", "21:20"],
    ) . "\n"; 
}
