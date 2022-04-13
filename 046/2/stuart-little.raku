#!/usr/bin/env raku
say (1..500).grep({ $_.sqrt.floor ** 2 == $_ })
