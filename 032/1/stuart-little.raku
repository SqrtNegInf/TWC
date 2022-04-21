#!/usr/bin/env raku

my %*SUB-MAIN-OPTS=:named-anywhere,;
sub MAIN(
    @FILES = ['example.txt'],
    ) {

    sub freq(@a,$cflag) {
	my @bg=@a.Bag.sort({$^b.value leg $^a.value});
	(! $cflag) ??
	(@bg) !!
	(@bg.map({ $_.key ~ ',' ~ $_.value }))
    }
    
    my @a=(! @FILES)
    ?? ($*IN.lines)
    !! (@FILES.map({ $_.IO.lines }).flat);
    for freq(@a,False) {.say};
}

