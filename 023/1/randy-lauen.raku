#!/usr/bin/env raku

#sub MAIN( Int :$order!, *@numbers where *.elems > 0 ) {

my $order = 1; my @numbers = (5, 9, 2, 8, 1, 6);
    for 1 .. $order -> $i {
        @numbers = @numbers.tail(*-1) >>->> @numbers;
        say "$i: @numbers.join(', ')";
        last if @numbers.elems == 1;
    }
