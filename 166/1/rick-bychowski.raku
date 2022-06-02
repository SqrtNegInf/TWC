#!/usr/bin/env raku
#use Data::Dump;

sub MAIN(Str $dict where *.IO.f = 'words.txt') {
    for $dict.IO.lines -> $word {
        next unless 1 < $word.chars < 9;
        my @hex;
        my $trans = 0;
        loop (my $i = 1; $i <= $word.chars; $i++) {
            my $l = $word.split('')[$i];
            last unless $l ~~ /<[ a b c d e f o l i s t ]>/;
            # Limit translations to 2 or less
            $trans++ if $l ~~ /<[ l i s t]>/;
            last if $trans > 2;
            @hex.push($l);
            if $i == $word.chars {
                say "0x" , @hex.join('').trans('ostli' => '0571').uc;
            }
        }
    }
}
