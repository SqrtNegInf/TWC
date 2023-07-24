#!/usr/bin/env raku

#sub MAIN( Str $string, *@indexes where { @indexes.grep( * ~~ Int ).elems == @indexes.elems && @indexes.elems == $string.chars }) {

my $string = 'lacelengh';
my @indexes = [3,2,0,5,4,8,6,7,1];
    my $index = 0;
    my %letters;
    %letters{ @indexes[ $index++ ] } = $_  for $string.comb;

    %letters{ @indexes.sort }.join.say;

#}
