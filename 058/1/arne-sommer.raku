#!/usr/bin/env raku

unit sub MAIN (Str $v1 = '1.2.1', Str $v2 = '1.2_2' );

say (Version.new($v1) <=> Version.new($v2)).Int;
