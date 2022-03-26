#!/usr/bin/env raku

sub tripl(@a) {
    @a.combinations(3).grep(1 < *.sum < 2).[0];
}

say (my $res=tripl((1.2, 0.4, 0.1, 2.5).map(*.Real))) ?? ("1: $res") !! 0;

# run as <script> <space-separated numbers>
