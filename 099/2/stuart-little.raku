#!/usr/bin/env raku

# run <script> <string1> <string2>

sub counts(@ambient, @small)  {
    (! @small) && return 1;
    (! @ambient) && return 0;    
    return (0..^@ambient.elems).grep({ @ambient.[$_] === @small.head }).map({ @ambient[$_^..^@ambient.elems] }).map({ counts($_,@small[1..*]) }).sum
}

say counts('littleit'.comb, 'lit'.comb)
