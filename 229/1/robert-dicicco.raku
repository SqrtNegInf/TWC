#!/usr/bin/env raku

my @strs = (["abc", "bce", "cae"],["yxz", "cba", "mon"]);

my $cnt = 0;

sub CheckLexOrder($e) {
    my $lexstr = $e.comb.sort.join;
    ($e eq $lexstr) || ($e eq $lexstr.flip)  ?? (1) !! (0);
}

for (@strs) -> @str {
    say "Input: \@str = ",@str;
    for ( @str) -> $elm {
        my $retval = CheckLexOrder($elm);
        $cnt++ if ($retval == 0);
    }
    say "Output: $cnt\n";
    $cnt = 0;
}
