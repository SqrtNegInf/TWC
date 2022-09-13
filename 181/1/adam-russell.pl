#!/usr/bin/env perl
use v5.36;

sub sort_paragraph{
    my($paragraph) = @_;
    my @sentences = split(/\./, $paragraph); 
    for(my $i = 0; $i < @sentences; $i++){
        $sentences[$i] = join(" ", sort {uc($a) cmp uc($b)} split(/\s/, $sentences[$i]));
    }
    return join(".", @sentences);
}

MAIN:{
    my $paragraph = do{
        local $/;
        <DATA>;
    };
    print sort_paragraph($paragraph);
}

__DATA__
All he could think about was how it would all end. There was
still a bit of uncertainty in the equation, but the basics
were there for anyone to see. No matter how much he tried to
see the positive, it wasn't anywhere to be seen. The end was
coming and it wasn't going to be pretty.
