#!/usr/bin/env raku

my @N = (1, 0, 3, 0, 0, 5);

for +@N ^... 0 -> \j {
    @N.push(@N.splice(j, 1)) if @N[j] == 0;
}
put @N.join(', ');
