#!/usr/bin/env raku

sub find-shortest-ladder( 
    Str:D $start-word, 
    Str:D $end-word where *.chars == $start-word.chars,
    Str:D $file     where *.IO.e && *.IO.f,
) is export {
    my @lexicon = $file.IO.lines».lc;
    
    # check the input words have the same length as the first word
    # in the wordlist.
    return [] if @lexicon.first.chars != any ($start-word, $end-word)».chars;
   
    # check input words are in the wordlist.
    return [] if ($start-word | $end-word) ∉ @lexicon;

    my @partial-ladders;
    @partial-ladders.push: [$start-word];

    while @partial-ladders {
        my @first-ladder = |@partial-ladders.shift;            

        # if $end-word is found in the current ladder...
        return @first-ladder if $end-word ∈ @first-ladder;

        for ortographic-neighbors-of(@first-ladder.tail, @lexicon) -> $word {
            # if word hasn't been used in a ladder, add it to a copy 
            # of current ladder and add this new ladder to partial ladders.
            if not has-been-used($word, @partial-ladders) {
                my @copy-ladder = @first-ladder;
                @copy-ladder.push: $word;
                @partial-ladders.push: @copy-ladder;
            }
        }
    }

    return [];
}

#| Return all the words that differ from $word by a single character.
sub ortographic-neighbors-of( Str:D $word, @lexicon --> Array:D ) {
    my @result;
    for @lexicon -> $lword {
        my $different-letters = 0;
        for 0 ..^ $word.chars -> $idx {
            $different-letters++ if $word.comb[$idx] ne $lword.comb[$idx];
        }
        @result.unshift($lword) if $different-letters == 1;
    }
    return @result;
}

#| Check if $word has been used in a ladder already.
sub has-been-used( Str:D $word, @partial-ladders ) {
    for @partial-ladders -> $ladder {
        return True if $word ∈ $ladder;
    }
    return False;
}

sub MAIN(
    Str:D :i($first)  = 'bat', #= First word
    Str:D :s($second) = 'big', #= Second word
    Str:D :f($file)   = 'words3',   #= Word list
) {
    die "$file: Not a file" unless $file.IO.e and $file.IO.f;
    my $result = find-shortest-ladder($first, $second, $file);
    put do if $result {
        $result.join(' → ');
    }
    else {
        "No ladder found between '$first' and '$second' with wordlist '$file'."
    }
}
