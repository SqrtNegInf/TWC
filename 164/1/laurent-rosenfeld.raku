#!/usr/bin/env raku
say (1..^1000).grep({ $_ == .flip }).grep({.is-prime});
