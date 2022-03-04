#!/usr/bin/env raku

say ^201 .grep( * !~~ /1/ ).eager.elems;
