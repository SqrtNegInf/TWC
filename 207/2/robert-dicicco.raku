#!/usr/bin/env raku

my @citations = ([10,8,5,4,3],[25,8,5,3,3]);

sub CalcIndex(@c) {
    my $ln = @c.elems;
    my $offset = $ln;
    $offset = $ln-1;
    my $pos = $ln;
    while $offset >= 0 {
        if @c[$offset] >= $pos {
            say "Output: $pos\n";
            return;
        } else {
            $offset--;
            $pos--;
        }
    }

}

for (@citations) -> @c {
    say "Input: \@citations = ",@c;
    CalcIndex(@c);
}
