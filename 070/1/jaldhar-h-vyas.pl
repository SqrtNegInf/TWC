#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no_match_vars- /;

sub usage {
    print<<"-USAGE-";
Usage:
  $PROGRAM_NAME <C> <O> <S>

    <C>    swap count
    <O>    offset
    <S>    string (length <= count + offset)
-USAGE-

    exit(0);
}


my ($C, $O, $S) = (3, 4, 'perlandraku');
my $N = length $S;

if ($C < 1 || $O < 1 || $C > $O || $C + $O > $N) {
    usage();
}

my @chars = split //, $S;
for my $i (1 .. $C) {
    my $a = $i % $N;
    my $b = ($i + $O) % $N;
    my $temp = $chars[$a];
    $chars[$a] = $chars[$b];
    $chars[$b] = $temp;
}

say join q{}, @chars;
