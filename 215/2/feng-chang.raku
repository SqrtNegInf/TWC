#!/usr/bin/env raku

#unit sub MAIN(*@numbers where @numbers.head(*-1).all == 0|1);
my @numbers = <1 0 0 0 1>;

@numbers .= map: *.Int;
my $count = @numbers.pop;

put +((^(+@numbers - 2)).grep({ @numbers[$_..$_+2].all == 0 }) ≥ $count);
