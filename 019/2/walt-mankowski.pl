#!/usr/bin/env perl
use v5.36;

my $txt = <<EOT;
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Dolor sed
viverra ipsum nunc aliquet bibendum enim. In massa tempor nec
feugiat. Nunc aliquet bibendum enim facilisis gravida. Nisl nunc mi
ipsum faucibus vitae aliquet nec ullamcorper. Amet luctus venenatis
lectus magna fringilla. Volutpat maecenas volutpat blandit aliquam
etiam erat velit scelerisque in. Egestas egestas fringilla phasellus
faucibus scelerisque eleifend. Sagittis orci a scelerisque purus
semper eget duis. Nulla pharetra diam sit amet nisl suscipit. Sed
adipiscing diam donec adipiscing tristique risus nec feugiat in. Fusce
ut placerat orci nulla. Pharetra vel turpis nunc eget lorem
dolor. Tristique senectus et netus et malesuada.
EOT

my $width = 80;

say greedy_wrap($txt, $width);

sub greedy_wrap($txt, $width) {
    my @words = split /\s+/, $txt;
    my $para = shift @words;
    my $space_width = 1;

    my $left = $width - length($para);
    for my $word (@words) {
        if (length($word) + $space_width > $left) {
            $para .= "\n$word";
            $left = $width - length($word);
        } else {
            $para .= " " x $space_width;
            $para .= $word;
            $left -= $space_width + length($word);
        }
    }

    return $para;
}
