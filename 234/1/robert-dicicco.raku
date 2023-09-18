#!/usr/bin/env raku

my @wordlist = (["java", "javascript", "julia"],["bella", "label", "roller"],["cool", "lock", "cook"]);

for (@wordlist) -> @wds {
    my $wordnum = @wds.elems;
    my %seen = ();
    my $charlist = "";
    say "Input: \@words = ",@wds;
    my $cnt = 0;
    while $cnt < 3 {
        $charlist ~= @wds[$cnt];
        $cnt++;
    }
    my @arr = split("",$charlist);
    for ( @arr) -> $c {
        %seen{$c} += 1;
    }

    print "Output: (";
    for %seen.keys -> $k {
        if $k ne ' ' {
            if %seen{$k} >= $wordnum && %seen{$k} < (2 * $wordnum) {
                print "$k ";
            } elsif %seen{$k} == (2 * $wordnum) {
                print "$k $k "
            }
        }
    }
    print ")\n\n";
}
