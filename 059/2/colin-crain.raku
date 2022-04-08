#!/usr/bin/env raku
sub MAIN ( @input = (2,3,4)) {

    my @sets = @input.combinations: 2;
    my $sum = [+] @sets.map({bit_difference($_)});

    $sum.say;
}

sub bit_difference ($array) {
    return ([+^] |$array).base(2).comb.sum;
}
