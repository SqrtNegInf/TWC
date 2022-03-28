#!/usr/bin/env raku

sub MAIN(Str $A = 'XXY', Str $B = 'XXZ', Str $C = 'XXXXZY') {
    my $result;
    my ($a, $b, $c) = ($A, $B, $C);

   while ($a.chars || $b.chars) {
        "$a\0$c" ~~ /^ (.*) .* \0 $0/;
        my $prefixa = $0;
        $result ~= $prefixa;
        $a ~~ s/^ $prefixa//;
        $c ~~ s/^ $prefixa//;

        "$b\0$c" ~~ /^ (.*) .* \0 $0/;
        my $prefixb = $0;
        $result ~= $prefixb;
        $b ~~ s/^ $prefixb//;
        $c ~~ s/^ $prefixb//;
    }

    say ($result ~~ $C) ?? 1 !! 0;
}
