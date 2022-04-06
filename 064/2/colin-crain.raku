#!/usr/bin/env raku

#sub MAIN(Str:D $string, *@words) {
my $string = "perlweeklychallenge";
my  @words = ("weekly", "challenge", "perl");

    my $group = @words.join(' | ');
    my $matches = $string ~~ m:g/ <$group> /;
    $matches.list.elems ?? (.Str.say for $matches.list)
                        !!   say '0';

#    say "two:";
#    $matches = $string ~~ m:g/
#                             | weekly
#                             | perl
#                             | challenge
#                              /;
#    .Str.say for $matches.list;

#}
