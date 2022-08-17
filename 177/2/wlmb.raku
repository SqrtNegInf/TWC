#!/usr/bin/env raku

my $left=1;
my $count=0;
my $how_many=@*ARGS[0]//20;
while $count < $how_many {
    my $candidate=$left~0~$left.flip;
    if !($left ~~ /0/) && is-prime($candidate) {
        ++$count;
	"$candidate ".print;
    }
    ++$left;
}
"".say;
