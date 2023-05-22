#!/usr/bin/env raku
(31, 2, 4, 10).sort({"$^b$^a".Int <=> "$^a$^b".Int}).join('').put;
