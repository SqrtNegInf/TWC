#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2022/05/21/writing-it-down/

my $input = '333,129  39,189 140,156 292,134 393,52  160,166 362,122  13,193
                341,104 320,113 109,177 203,152 343,100 225,110  23,186 282,102
                284,98  205,133 297,114 292,126 339,112 327,79  253,136  61,169
                128,176 346,72  316,103 124,162  65,181 159,137 212,116 337,86
                215,136 153,137 390,104 100,180  76,188  77,181  69,195  92,186
                275,96  250,147  34,174 213,134 186,129 189,154 361,82  363,89';

sub delayed(&c) is rw {
        my $p = start { c };
        Proxy.new: STORE => method (|) {}, FETCH => method { await $p; $p.result }
    }

    my @points = $input.words».split(',')».Int;

    my \term:<x²> = delayed { @points[*;0]».&(*²) };
    my \xy = delayed { @points[*;0] »*« @points[*;1] };
    my \Σx = delayed { [+] @points[*;0] };
    my \Σy = delayed { [+] @points[*;1] }
    my \term:<Σx²> = delayed { [+] x² };
    my \Σxy = delayed { [+] xy };
    my \N = +@points;

    my $m = (N * Σxy - Σx * Σy) / (N * Σx² - (Σx)²);
    my $b = (Σy - $m * Σx) / N;

    say [$m, $b];
