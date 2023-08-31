#!/usr/bin/env perl
use v5.36;

my $form="9999999999A1122";
$form=~s/[9A2]/./g;     # Change form into a RE to obtain age. Change 9, A and 2 to any
$form=~s/(1+)/($1)/;    # Capture  1's
$form=~s/1/\\d/g;       # Change 1's to digits
$form=~s/^(.*)$/^$1\$/; # Add anchors
my $re=qr /$form/;
my @A = ('7868190130M7522', '5303914400F9211', '9273338290F4010');
say "@A -> ", 0+grep {/^...........(\d\d)..$/||die "Wrong format: $_"; $1>=60} @A;
