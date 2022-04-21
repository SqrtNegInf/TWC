#!/usr/bin/env raku

.fmt('%s: %d').say for '../00-blogs'.IO.comb».lc.Bag{'a'..'z'}:p;
