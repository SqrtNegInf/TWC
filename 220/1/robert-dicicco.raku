#!/usr/bin/env raku

my @words = <Perl Rust Raku>, <love live leave>;

my $str = join('', "a".."z");

for (@words) -> @wds {
    say "Input: \@words = ", @wds;
    my $sz = @wds.elems;    # number of words in each entry
    my $cnt = 0;
    my %found = ();         # hash to hold results
    my @out = ();           # array to hold output;
    while $cnt < $sz {      # for each one of the word entries
        my $strcnt = 0;
        while $strcnt < $str.chars {
            my $ch = substr($str, $strcnt++,1);
            my $arrch = lc(join('',@wds[$cnt]));
            if $arrch.contains($ch) {       # check to see if entry holds character
                if defined %found{$ch} {    # bump its count
                    %found{$ch}++
                } else {
                    %found{$ch} = 1;        # add it to the hash array
                }
            }
        }
        $cnt++;         # get next word
    }
    for %found.kv -> $k, $v {           # for keys, values in hash
        @out.push: $k if $v == $sz;     # push the key to @out array if in all words
    }
    say "Output: ",@out.sort;           # and say the results
    say " ";
}
