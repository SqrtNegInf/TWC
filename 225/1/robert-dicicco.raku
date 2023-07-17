#!/usr/bin/env raku

my @lists = [["Perl and Raku belong to the same family.",
                "I love Perl.",
                "The Perl and Raku Conference."],
                ["The Weekly Challenge.",
                "Python is the most popular guest language.",
                "Team PWC has over 300 members."]];

my $max_num = 0;
my $num = 0;

for (@lists) -> $lst {
    say "Input: \@list = ($lst)";
    my $cnt = 0;
    while $cnt < $lst.elems {
        $num = $lst[$cnt].comb(/\w+/).elems;
        if $num > $max_num {
            $max_num = $num;
        }
        $cnt++;
    }
    say "Output: $max_num\n";
    $max_num = 0;
    $num = 0;
}
