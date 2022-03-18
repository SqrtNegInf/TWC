#!/usr/bin/env perl
use warnings;
use strict;
use utf8;

{   my %fh;
    sub readN {
        my ($file, $chars) = @_;
        unless (exists $fh{$file}) {
            open $fh{$file}, '<:encoding(UTF-8)', $file;
        }
        read $fh{$file}, my ($buffer), $chars;
        return $buffer
    }
}

use Test::More tests => 3;

{   my $FILE = 'input.txt';
    #open my $out, '>', $FILE or die $!;
    #print {$out} '1234567890';
    #close $out;

    is readN($FILE, 4), '1234';
    is readN($FILE, 4), '5678';
    is readN($FILE, 2), '90';

    #unlink $FILE;
}
