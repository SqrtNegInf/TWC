#!/usr/bin/env raku

my ($array1, $array2, $array3) = [4,], [2, 4], [1,2,4];

say q{(}, ([∪] (@$array1 ∩ @$array2, @$array2 ∩ @$array3, @$array1 ∩ @$array3)).keys.sort.join(q{, }), q{)};
