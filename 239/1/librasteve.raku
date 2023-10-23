#!/usr/bin/env raku
say |(@arr1, @arr2)>>.join.map(* ~~ *);
