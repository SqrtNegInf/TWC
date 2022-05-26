#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2022/05/01/antipairing/

proto sub deepantipairs(@positional, $dimensions --> Positional) {*}
multi sub deepantipairs(@a, 2) {
    @a.pairs.map({ my $outer-key = .key; .value.antipairs.map({ .key => ($outer-key, .value) }) }).flat
}
my $phrase = 'Spring has sprung!';
my @table = flat($phrase.lc.comb.grep(/\w/), 'a'..'z').unique[^25].batch(5);
my %antitable = @table.&deepantipairs(2);

say %antitable.raku;

say '--';

sub encrypt($phrase, $text --> Str) {
    my @table = flat($phrase.lc.comb.grep(/\w/), 'a'..'z').unique[^25].batch(5);
    my %antitable = @table.&deepantipairs(2);

    my $retval;

    for $text.lc.comb.grep(/\w/) -> $char {
        my @deepindex := %antitable{$char};
        $retval ~= @table[||@deepindex];
        @table = @table».List.flat[1..*,0].flat.batch(5);
    }

    $retval
}

say encrypt($phrase, 'As suspicious questions on IRC and Discord revealed, there are quite a few solutions to the PWC that are not made public.');

