#!/usr/bin/env raku

sub rot(@a,@b) {
    @b.map({ |@a.[$_..*], |@a.[^$_] })
}

my @ARGS = <10 20 30 40 50 - 3 4>;

my @a=@ARGS[^(@ARGS.first('-',:k))];
my @b=@ARGS[(@ARGS.first('-',:k))^..*];

for (rot(@a,@b)) {
    .say;
}

# run as <script> <entries of the two arrays, separated by a '-'> with all individual entries space-separated
