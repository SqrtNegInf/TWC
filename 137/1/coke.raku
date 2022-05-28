#!/usr/bin/env raku
# from comment on gfldex's entry: https://gfldex.wordpress.com/2021/11/08/2nd-class-join/

put (1900..2100).grep({ Date.new(.Int, 1, 1).day-of-week | Date.new(.Int, 12, 31).day-of-week == 4 }).rotor(8, :partial).join(“\n”);
