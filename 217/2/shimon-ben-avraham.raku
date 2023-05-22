#!/usr/bin/env raku

sub max-number-cmp (UInt:D $a, UInt:D $b --> Order:D) {
    my @a=$a.comb; 
    my @b=$b.comb; 
    my $l = max(+@a, +@b); 
    for ^$l -> $i {  
        my $a = @a[$i] // @a[$i-1];
        my $b = @b[$i] // @b[$i-1];
        return $b <=> $a unless $a == $b;
    } 
    return Same;
} 

sub max-number (@list where .all ~~ UInt --> UInt) {
   return @list.sort(&max-number-cmp).join.UInt;
} 

#multi MAIN (:$test!) {
    use Test;

    my @tests = [
        %{ input => (1, 23),          output => 231,    text => 'Example 1' },
        %{ input => (10, 3, 2),       output => 3210,   text => 'Example 2' },
        %{ input => (31, 2, 4, 10),   output => 431210, text => 'Example 3' },
        %{ input => (5, 11, 4, 1, 2), output => 542111, text => 'Example 4' },
        %{ input => (1, 10),          output => 110,    text => 'Example 5' },
    ];

    for @tests {
        is max-number( .<input> ), .<output>, .<text>;
    }
#}
