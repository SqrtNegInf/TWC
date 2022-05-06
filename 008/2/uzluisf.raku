#!/usr/bin/env raku

sub center( *@strings --> List ) {
    my $max-len = @strings.sort({.chars}).tail.chars;
    return @strings.map({
        ( ' ' x (.chars - $max-len).abs div 2, $_).join
    }).list;
}

.say for center ('This', 'is', 'a test of the', 'centre function');
