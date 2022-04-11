#!/usr/bin/env raku

my $target = 0;
my  @L = sort(-25,  -7, -3, 2, 4, -10,8, 10);

for 0..@L.end {
    my $a = $_;
    for  $a+1..@L.end {
        my $b = $_;
        for  $b+1..@L.end {     
            my $c = $_;        
            if  (@L[$a] + @L[$b] + @L[$c]) == $target {
                say "@L[$a] + @L[$b] + @L[$c] = $target";
            }
        }
    }
}
