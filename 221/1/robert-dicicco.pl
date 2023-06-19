#!/usr/bin/env perl
use v5.36;

my $total_score = 0;

my @words = (["cat", "bt", "hat", "tree"], ["hello", "world", "challenge"]);
my @chlist = ("atach","welldonehopper");
my $cnt = 0;
for my $word (@words) {
    say "Input: \@words = (@$word)";
    my $chars = $chlist[$cnt];
    $total_score = 0;
    for my $w (@$word) {
        my $ln = length($w);
        my $score = 0;
        for (my $cnt = 0; $cnt < $ln; $cnt++){
            my $tst = substr($w,$cnt,1);
            if ($chars =~ /$tst/) {
                 $score++;
            } else {
                 last;
            }

        }
        if ($score == $ln) {
            say $w;
            $total_score += $score;
            $score = 0;
        }
     }
     say "\tTotal: ", $total_score;
     say "";
     $cnt++;
}
