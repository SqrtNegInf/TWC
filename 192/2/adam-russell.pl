#!/usr/bin/env perl
use v5.36;

use POSIX;

sub equal_distribution{
    my(@integers) = @_;
    my $moves;
    my $average = unpack("%32I*", pack("I*",  @integers)) / @integers; 
    return -1 unless floor($average) ==  ceil($average);
    {
        map{
            my $i = $_;
            if($integers[$i] > $average && $integers[$i] > $integers[$i+1]){$integers[$i]--; $integers[$i+1]++; $moves++}
            if($integers[$i] < $average && $integers[$i] < $integers[$i+1]){$integers[$i]++; $integers[$i+1]--; $moves++}
        } 0 .. @integers - 2;
        redo unless 0 == grep {$average != $_} @integers;
    }
    return $moves;
}

MAIN:{
    say equal_distribution(1, 0, 5);
    say equal_distribution(0, 2, 0);
    say equal_distribution(0, 3, 0);
}
