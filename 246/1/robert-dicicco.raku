#!/usr/bin/env raku

srand 1;

my $cnt = 0;
my @out = ();
while 1 == 1 {
    my $num = 49.rand.Int;
    if $num > 0 {
        @out.push: $num;
        $cnt++;
    }
    last if $cnt == 6;
}
say @out.sort;
