#!/usr/bin/env perl
use v5.36;

my $msg = [
    [qw# P + 2 l ! a t o #],
    [qw# 1 e 8 0 R $ 4 u #],
    [qw# 5 - r ] + a > / #],
    [qw# P x w l b 3 k \ #],
    [qw# 2 e 3 5 R 8 y u #],
    [qw# < ! r ^ ( ) k 0 #],
];

my $msg_len = scalar @{$msg->[0]};
my @decrypted = ('?') x $msg_len;

for my $i (1 .. @{$msg}-1) {
    for my $j (0 .. $i-1) {
        for (0 .. $msg_len-1) {
            $decrypted[$_] = $msg->[$i]->[$_] if ($msg->[$i]->[$_] eq $msg->[$j]->[$_]);
        }
    }
    print @decrypted,"\n";
}
