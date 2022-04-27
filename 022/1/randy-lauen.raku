#!/usr/bin/env raku

say (1 .. Inf).map( { $_, $_+6 } ).flat.grep( { $^a.is-prime && $^b.is-prime } ).head(10).join("\n");
