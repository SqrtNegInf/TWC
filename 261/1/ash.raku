#!/usr/bin/env raku

my @tests = 
    (1, 2, 3, 45),
    (1, 12, 3),
    (1, 2, 3, 4);

for @tests -> @test {
    my $sum = [+] @test;
    my $dig = [+]((@test.map: *.comb).flat);
    say ($dig - $sum).abs;
}
