#!/usr/bin/env perl
use v5.36;

my %chars;
$chars{$_}++ for (split(//, 'atach'));

my $total;

foreach ( <cat bt hat tree> ) {
    my @currWordChars = split(//, $_);
    my %list = %chars;
    my $notFound;

    for my $char (@currWordChars) {
        if ($list{$char}) {
            $list{$char}--;
        } else {
            $notFound = 1;
            last;
        }
    }
    $total += ($notFound ? 0 : @currWordChars);
}
say $total;
