#!/usr/bin/env raku

my @list = (1, 1, 4, 2, 1, 3);
say [+] (@list Z== @list.sort);
