#!/usr/bin/env raku

quietly .say for (1..1000).grep({    $_.is-prime 
                         and $_ ~~ m:ex/^ (.*) {} .? "{$0.flip}" $/});
# ^^^^^ added 
