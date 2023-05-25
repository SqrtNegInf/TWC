#!/usr/bin/env perl
use v5.36;

use Text::Wrap;

my $length=25; # keep this many paths
foreach(3){
    my @paths=P($_-1,$_-1);
    @paths=(@paths[0..$length], "...") if @paths>$length;
    say "\nHeight: $_\nNumber of paths: ", N($_-1,$_-1), "\nPaths:\n", wrap ("\t", "\t", @paths);
}
sub N { #Number of paths
    my ($row, $column)=@_;
    return 0 if $column>$row;
    return 0 if $column<0;
    return 0 if $row < 0;
    return 1 if $row==0 and $column==0;
    return N($row, $column-1)+N($row-1, $column-1)+N($row-1, $column);
}
sub P { #actual paths
    my ($r, $c)=@_; #row column
    return () if $c>$r;
    return () if $c<0;
    return () if $r < 0;
    return ("") if $r==0 and $c==0;
    return ((map {$_."H"} P($r, $c-1)), (map {$_."R"} P($r-1, $c-1)), (map {$_."L"} P($r-1, $c)));
}
