#!/usr/bin/env raku
#my @array = (11..35).pick: 25;

my @array= <9 10 7 5 6 1>;

my $max = @array.max;

my @results = @array.pop;
    
while @array.pop -> $n {
    @results.unshift: $n if $n > @results.head;

    last if $n == $max;
}

say @results;
