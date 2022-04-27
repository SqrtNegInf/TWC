#!/usr/bin/env raku

say (3..*).grep({ $_.is-prime && ($_+6).is-prime }).[0..^10].map({ $_, $_+6 })
