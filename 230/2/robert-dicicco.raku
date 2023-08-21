#!/usr/bin/env raku

my @wds = (["pay", "attention", "practice", "attend"],["janet", "julia", "java", "javascript"]);
my @prefix = ("at", "ja");

my $cnt = 0;
#my $seen = 0;
for (@wds) -> @w {
my $seen = 0;
    say "Input:  \@words = ",[@w];
    my $p = @prefix[$cnt];
    say "\t\$prefix = \"$p\"";
    for (@w) -> $elem {
        if $elem ~~ /^$p/ {
            $seen++;
        }
    }
    say "Output: $seen\n";
    $cnt++;
}
