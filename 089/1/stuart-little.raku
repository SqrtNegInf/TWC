#!/usr/bin/env raku

say (1..100.Int).combinations(2).map({ $_[0] gcd $_[1] }).sum

# run as <script> <number>
