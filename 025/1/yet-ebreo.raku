#!/usr/bin/env raku

my Str @names = <audino bagon baltoy banette bidoof braviary bronzor carracosta charmeleon cresselia croagunk darmanitan deino emboar emolga exeggcute gabite girafarig>;

my Array @chain;
my %hash = ();
my int $max_length = 0;
sub MAIN {
    #We are still using hash but will be looking at the last char instead
    for 'a'..'z' -> $n {
        %hash{$n} = @names.grep(/$n$/);
    }

    #The code below list down the candidates for last names,
    #These are names ending with letter which is NOT 
    #a starting letter of any name in the list @names
    my Str @last_names;
    for @names -> $name {
        my $last = $name.substr(*-1);
        (!grep {/^$last/}, @names) &&  @last_names.push($name);
    }

    #The code below was added to further filter out @last_names
    #and find the best candidate(s) and store it in @best_last
    #The name in @last_name with the most number of linkage 
    #(its first char is same as last char of name in @names) will be used 
    my @best_last;
    for @last_names -> $lname {
        my $first = $lname.substr(0,1);
        my $count = grep { /$first$/}, @names;

        @best_last[$count].push($lname);
    }

    #Use the @best_last as starting point
    for @best_last[*-1] -> @last {
        for @last -> $e {
            my Str $m_name_chain = "";
            iter($e, $m_name_chain, %hash{$e.substr(0,1)}.Seq );
        }
    }

    #Print the longest sequence
    #Print all when they are tied
    say "Sequence:";
    for @chain[*-1] -> @r {
        for @r -> $e {
            say ">"~$e.chop~"\n";
        }
    }
    say "Highest chain count: "~@chain.end;
    say "Number of Sequence found: "~(1+@chain[*-1].end);
    #say "Run Time: "~(now - INIT now)~" sec";
}

sub iter {
    my (Str $m_name, Str $m_name_chain, Str @m_name_list) = @_;
    $m_name_chain = " $m_name >" ~ $m_name_chain;
    for @m_name_list -> $name {
        #check and skip if the $name is already in the name sequence in string format 
        #(stored in $m_name_chain)
        if (!$m_name_chain.contains($name)) {
            iter($name, $m_name_chain, %hash{$name.substr(0,1)}.Seq);
        }
    }

    my int $length = +$m_name_chain.comb: ">";
    if ($length >= $max_length) {
        @chain[$length].push($m_name_chain);
        $max_length = $length;
    } 
}
# #Sample output
# Sequence:
# > machamp > petilil > loudred > darmanitan > nosepass > simisear > rufflet > trapinch > heatmor > registeel > landorus > scrafty > yamask > kricketune > emboar > relicanth > haxorus > seaking > girafarig > gabite > exeggcute > emolga > audino
# ..
# > machamp > pinsir > rufflet > trapinch > haxorus > seaking > girafarig > gabite > exeggcute > emboar > relicanth > heatmor > registeel > landorus > simisear > remoraid > darmanitan > nosepass > starly > yamask > kricketune > emolga > alduino
#
# > machamp > pinsir > relicanth > haxorus > seaking > girafarig > gabite > exeggcute > emboar > rufflet > trapinch > heatmor > registeel > landorus > simisear > remoraid > darmanitan > nosepass > starly > yamask > kricketune > emolga > alduino
# 
# Highest chain count: 23
# Number of Sequence found: 1248
# Run Time: 56.786985 sec
# 
# It is still slow compared to my perl5 version, but a big improvement to my previous perl6 solutions
