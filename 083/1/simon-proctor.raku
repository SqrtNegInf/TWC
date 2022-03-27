#!/usr/bin/env raku

#| Reads from standard input. Counts the numbers of characters ignoring the first and last word and any whitespace
#sub MAIN() {
    my ($total, $count, $last) = (0,0,0);
    for 'Markmið lífs okkar er að vera hamingjusöm'.words -> $word {
        next unless $count++;
        $total += $last;
        $last = $word.codes;
    }
    say $total;
#}
