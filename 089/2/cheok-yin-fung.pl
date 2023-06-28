#!/usr/bin/env perl
use v5.36;

my $number_of_ans = 0;
my ($a, $b, $c, $d, $e, $f, $g, $h, $i);


$e = 5;

for my $a (1..4, 6..9) {
    for my $b (1..4, 6..9) {
        next if $a == $b;
        my %nine;
        $i = 10-$a;
        $c = 15-$a-$b;
        $h = 10-$b;
        $g = 10-$c;
        $d = 15-$a-$g;
        $f = 15-$c-$i; 
        
        my @term = (\$a, \$b, \$c, \$d, \$e, \$f, \$g, \$h, \$i);
        $nine{$_} = 0 for (1..9);
        for (@term) {
            if ($$_ >= 1 and $$_ <= 9) {$nine{$$_}++;}
        }
        my $bool = 1;
        my $count = 1;
        while ($count <= 9 and $bool) {
            $bool = ($nine{$count} == 1);
            $count++;
        }
        print " $a $b $c \n $d $e $f\n $g $h $i\n\n" if $bool;
        $number_of_ans++ if $bool;
    }
}

print $number_of_ans, "\n";
