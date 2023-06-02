#!/usr/bin/env perl
use v5.36;

sub count_most_words{
    my ($s) = @_;
    my $count = 0;
    my @a = split(/\s/, $s);
    map {$count += tr/a-zA-Z//d} @a[1 .. (@a - 2)];
    return $count;
}

MAIN:{
    my $S;
    $S = "The Weekly Challenge";
    print "$S --> " . count_most_words($S) . "\n";
    $S = "The purpose of our lives is to be happy";
    print "$S --> " . count_most_words($S) . "\n";
    $S = "Markmið lífs okkar er að vera hamingjusöm";
    print "$S --> " . count_most_words($S) . "\n"; # not the same as Raku, multi-byte
}
