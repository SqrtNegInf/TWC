#!/usr/bin/env raku

sub CheckZeroes(@arr is copy) {
    my $zcnt = 0;
    #say "zcnt = $zcnt";
    while $zcnt < @arr.elems - 1 {
        if ((@arr[$zcnt] == 0) && (@arr[$zcnt-1] == 0)) {
             @arr[$zcnt] = 1;
        }
        $zcnt++;
    }
    say "Output: 1 = ",@arr;
}

sub HowManyZeroes(@arr) {
    my $z = 0;
    my $zcnt = 0;
    while $z < (@arr.elems) - 1 {
        if (@arr[$z] == 0) {
            $zcnt++;
        }
        $z++;
    }
    return $zcnt;
}

#unit sub MAIN ($count where 0 <= $count <= 9, *@numbers where @numbers.elems > 0 && all(@numbers) ~~ UInt);
my  $count = 1;
my @numbers= (1, 0, 0, 0, 1);
say "Input: \@numbers = ", @numbers;
say "Count = $count";

#my $test = HowManyZeroes(@numbers);

my $zeroes = HowManyZeroes(@numbers);

if ($zeroes < $count * 2) {
    say "Output: 0";
} else {
    CheckZeroes(@numbers);
}

