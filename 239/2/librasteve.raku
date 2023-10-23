#!/usr/bin/env raku
say +@str.grep(*.comb ⊆ .comb);
