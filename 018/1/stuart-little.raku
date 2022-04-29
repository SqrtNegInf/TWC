#!/usr/bin/env raku

my @ARGS = <zabc xabcy abcd>;
say (0..( my $minword=@ARGS.min(*.chars); $minword.chars ).[1]).combinations(2).map({ $minword.substr($_[0]..^$_[1]) }).grep({ @ARGS.all.contains($_) }).max(*.chars)
