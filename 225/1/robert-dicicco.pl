#!/usr/bin/env perl
use v5.36;

my @lists = (["Perl and Raku belong to the same family.",
                "I love Perl.",
                "The Perl and Raku Conference."],
                ["The Weekly Challenge.",
                "Python is the most popular guest language.",
                "Team PWC has over 300 members."]);

my $max_num = 0;
my $num = 0;

sub count_words {
    my $num;
    my $lst = shift;
    $num++ while $lst =~ /\S+/g;
    return $num;
}

for my $lst (@lists) {
    say "Input: \@list = (",@$lst,")";
    for my $wds (@$lst) {
        $num = count_words($wds);
        if ($num > $max_num) {
            $max_num = $num;
        }
    }
    say "Output: $max_num\n";
    $max_num = 0;
    $num = 0;
}
