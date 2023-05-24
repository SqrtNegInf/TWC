#!/usr/bin/env perl
use v5.36;

use Memoize;
memoize("points");

foreach (4){
    say "Input: $_\nOutput:\n\t", join "\n\t", map {join " ", @$_} points($_);
}
sub points{
    my $s=shift;
    return ()  if $s<=0;
    # Append a 1, 2 or 3 point throw to the previous points
    my @result=((map {my @x=@$_;push @x,1; [@x]}points($s-1)),
		(map {my @x=@$_;push @x,2; [@x]}points($s-2)),
		(map {my @x=@$_;push @x,3; [@x]}points($s-3)));
    push @result, [$s] if $s<=3;
    return @result;
}
