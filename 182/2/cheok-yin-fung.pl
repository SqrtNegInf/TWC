#!/usr/bin/env perl
use v5.36;
use List::Util qw/all/;

my @files = qw{
    /a/b/c/d/x.pl
    /a/b/c/1/x.pl
    /a/b/c/d/e/2/x.pl
    /a/b/c/d/3/x.pl
    /a/b/c/4/x.pl
    /a/b/c/d/5/x.pl
};

my @arr;
my $i = 0;

push @arr, [split "/", $_] foreach @files;

my $a = shift @arr;

while (defined($a->[$i]) && all {$_->[$i] eq $a->[$i]} @arr) {
    $i++;
    last if $a->[$i] =~ /\./;
}

$i--;

say $i > 0 ? (join "/", $a->@[0..$i]): "/";

