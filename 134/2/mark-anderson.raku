#!/usr/bin/env raku

unit sub MAIN(UInt $r = 5, UInt $c = 5);

my @table;

@table[.head;.tail] = .head.succ * .tail.succ for ^$r X ^$c;

my @uniq = @table>>.Slip.flat.unique.sort;

my $fmt = ($r * $c).chars;

say .fmt("%{$fmt}d").substr($fmt - $r.chars) for @table;

say "\nDistinct Terms: ", @uniq.join(", "), "\nCount: ", +@uniq;
