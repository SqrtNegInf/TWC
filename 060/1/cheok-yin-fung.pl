#!/usr/bin/env perl
use v5.36;

my $MAX = 16384;

print numtoExcelCol(28)," \n";
print excelcoltoNum('AB'),"\n";


sub AtoOne {
    my $c = $_[0];
    return (1+ord($c)-ord('A'));
}

sub AtoZero {
    my $c = $_[0];
    return (ord($c)-ord('A'));
}

sub OnetoA {
    my $f = $_[0];
    return chr($f+ord('A')-1);
}

sub numtoExcelCol {
    my $number = $_[0];
    if ($number <= 26) {
        return OnetoA($number);
    }
    if ($number > 26 and $number <= 26+676) {
        my $temp = $number % 26 ;
        $temp = 26 if $temp == 0;
        return (OnetoA(($number-1)/26).OnetoA($temp));
    }
    if ($number > 26+676) {
        my $r = int (($number - 1 - 26) /676);
        my $s = $number - ($r * 676);
        return (OnetoA($r).numtoExcelCol($s));
     }
}



sub excelcoltoNum {
    my $col = $_[0];
    if (length($col) == 1) {
        return AtoOne($col);
    }
    if (length($col) == 2) {
        my @s = split //, $col;
        return (AtoZero($s[0])*26+AtoOne($s[1])+26);
    }
    if (length($col) == 3) {
           my @s = split //, $col;
        return (AtoZero($s[0])*676
               + AtoZero($s[1])*26
               + AtoZero($s[2])
               + 1 + 26 + 676);
    }

}
