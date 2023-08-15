#!/usr/bin/env perl
use v5.36;

countRemovals(["abc", "bce", "cae"]);       # 1
countRemovals(["yxz", "cba", "mon"]);       # 2

sub countRemovals($arrRef)
{
    my $retVal = @$arrRef - @{deleteNotOrdered($arrRef)};
    say $retVal;
    return $retVal;
}

sub deleteNotOrdered($arrRef)
{
    # order it both ways and check each
    my @newArray = grep{ (join('', sort split("", $_)) eq $_) or (join('', sort { $b cmp $a} split("", $_)) eq $_)} @$arrRef;
    
    return \@newArray;
}
