#!/usr/bin/env raku
'123'>>.Num>>.base(35)>>.&{say "Base 35: $_"; $_}>>.parse-base(35)>>.&{say "Base 10: $_"};
