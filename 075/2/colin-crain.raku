#!/usr/bin/env raku

unit sub MAIN () ;

## cfg
my @A = <2 1 4 5 3 7>;
my @windows;

## work
for (^@A.elems).combinations(2) -> ($start, $end) {
    my $min = @A[$start..$end].min;
    @windows.push: ($min*($start..$end).elems, $start, $end, $min);
}

my $max     = @windows.max({$_[0]});
my @largest = @windows.grep({ $_[0] == $max[0] });


## out
say "array ", @A, "\n";
for @largest -> @r {
    my $width = @r[2]-@r[1]+1;
    
    say qq:to/__EOD__/;
        rectangle found at:
            start index @r[1]
            end index   @r[2]
            height      @r[3]
            width       $width
            area        @r[0]
        __EOD__
}

