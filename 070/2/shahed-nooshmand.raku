#!/usr/bin/env raku
# hmmm...

say [''], { |.map(0 ~ *), |.reverse.map(1 ~ *) } … 16; # must be power of 2
say  '';
say flat '', { |.map(0 ~ *), |.reverse.map(1 ~ *) } … 16;
