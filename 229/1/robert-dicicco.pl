#!/usr/bin/env perl
use v5.36;

my @strs = (["abc", "bce", "cae"],["yxz", "cba", "mon"]);

my $cnt = 0;

sub CheckLexOrder($e) {
    my $lexstr = join("",sort(split("",$e)));
    ($e eq $lexstr) or ($e eq reverse($lexstr)) ? return 1 : return 0;
}

for my $str (@strs) {
    say "Input: \@str = (@$str)";
    for my $elm ( @$str) {
        my $retval = CheckLexOrder($elm);
        $cnt++ if ($retval == 0);
    }
    say "Output: $cnt\n";
    $cnt = 0;
}
