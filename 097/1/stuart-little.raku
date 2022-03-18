#!/usr/bin/env raku

# run <script> <quoted string> <number>

say 'RAKU ROCKS'.trans(['A'..'Z'] => ['A'..'Z'].rotate(26-13))

