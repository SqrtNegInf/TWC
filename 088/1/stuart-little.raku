#!/usr/bin/env raku
use v6;

sub skipprod(@a) { @a.keys.map({ @a.keys.grep(* !~~ $_) }).map({ [*] @a[@($_)] }) }

say <5 2 1 4 3>.map(*.Int).&skipprod

# run as <script> <space-separated array entries>
