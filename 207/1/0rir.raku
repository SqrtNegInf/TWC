#!/usr/bin/env raku

use Test;

my @Test =
    [ ["Hello","Alaska","Dad","Peace"], ["Alaska","Dad"].Set ],
    [ ["Hello","Alaska","Dad","Peace"], ["Alaska","Dad"].Set ],
    [ ["Try","Daff","XXX"], ["Daff","Try","XXX"].Set ],
    [ ["OMG","Bye"], [].Set ],
#    [ ["were","tort","yup","trey","popeye","pout","we",
#       "you","i","rue","quiet","etiquette","tire","retort",
#       "wet", "wry","rye", "trope","yet",],
#      ["were","tort","yup","trey","popeye","pout","we",
#       "you","i","rue","quiet","etiquette","tire","retort",
#       "wet", "wry","rye", "trope","yet",].Set ],
#    [ ["tie","rotor","op","worry","queue","or","try","type","True",
#       "out","iop","write","put","rw","ro","quit","top","tree",
#       "as","has","add","trie"],
#      ["tie","rotor","op","worry","queue","or","try","type","True",
#       "out","iop","write","put","rw","ro","quit","top","tree",
#       "as","has","add","trie"].Set ],
;

my @T-keyboard-live =
    ['qwer', 'tyuiop', 'asd', 'fghjkl', 'zxc',' vbnm'],     ['a','b'],
    ['qwertyuiop', 'asdfghjkl', 'zxcvbnm'],                 ['a',],
    ['qwertyuiopasdfghjklzxcvbnm'],
;

my @T-keyboard-die =
    [,].Array,                  ['qwe', 'asd', '', 'zxc'],
    ['qawe', 'asd', 'zxc'],     ['qwe', 'asd', 'zxec'],
    ['qwe', 'axsd', '', 'zxc'],
;
plan 10; #@Test + @T-keyboard-die + @T-keyboard-die;

my @qwerty-def = 'qwertyuiop', 'asdfghjkl', 'zxcvbnm';

#   Keyboard convert and validate.
sub keyboard-valid( @kb-def where * !~~ Empty --> Array) {

    my @kr = @kb-def.map: *.lc.comb.Set;

    for ^@kr -> $me {
        for ^@kr -> $other {
            next if $me == $other;
            if        (@kr[$me] ∩ @kr[$other]  ≢ Empty    )
                   or (@kr[$me]                ≡ Empty.Set)
                   or (           @kr[$other]  ≡ Empty.Set)
            {
                die 'Bad keyboard: empty line or shared keys.';  # ??? rules
    }   }   }
    @kr;
}

sub filter-one-row-words( @word, @key-row-def --> Set) {
    my @one-row-word = gather for @word -> $w {
        if $w.lc.comb.Set ⊆ @key-row-def.any {
            take $w;
            next;
    }   }
    @one-row-word.Set;
}

for @T-keyboard-live -> @t {
    lives-ok { keyboard-valid @t }, 'live';
}
for @T-keyboard-die -> @t {
    dies-ok { keyboard-valid @t }, 'die';
}

my @kr = keyboard-valid( @qwerty-def);

for @Test -> (@in, $exp) {
    say my $got = filter-one-row-words( @in, @kr);
    #is-deeply $got, $exp, "$got"
}
done-testing;

my @array =  'Raku','do', 'does', 'any', "tie","rotor","worry",
             "queue","or","try","type","True", 'when','error',
             "out","write","put",'for',"rw","ro","quit","tree",
             "as","has","add","trie", 'once';

my $set = filter-one-row-words( @array, @kr);
say "\nInput: @array = (@array.sort())";
say "        Output: ", $set.keys.sort;
