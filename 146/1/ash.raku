#!/usr/bin/env raku

say ((2...*).grep: *.is-prime)[10000]

# 104743
