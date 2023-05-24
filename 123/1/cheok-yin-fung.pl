#!/usr/bin/env perl
use v5.36;
use Test::More tests => 3;

my $n = $ARGV[0] || 150;
my $ugly = [1];

say nth_seq_num($ugly, $n); 

sub nth_seq_num { 
    my @seq = $_[0]->@*;
    my $parameter = $_[1];
    my $k;
    my $i = 0;
    while (scalar $_[0]->@* < $parameter) {
        $i++;
        $k = $_[0]->[-1] + $i;
        my $j = $k;
        my $tmp_j = 0;
        while ( $j != 1 && $tmp_j != $j) {
            $tmp_j = $j;
            $j /= 2 if $j % 2 == 0;
            $j /= 3 if $j % 3 == 0;
            $j /= 5 if $j % 5 == 0;
        }
        if ($j == 1) {
            push $_[0]->@*, $k;
            $i = 0;
        } 
    }
    return $_[0]->[$parameter-1];
}


# some data from https://oeis.org/A051037
ok nth_seq_num($ugly, 10 ) == 12 , "test case n = 10"; 
ok nth_seq_num($ugly, 33 ) == 96 , "test case n = 33";
ok nth_seq_num($ugly, 52 ) == 256 , "test case n = 52";
done_testing();
