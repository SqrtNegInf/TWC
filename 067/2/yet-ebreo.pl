#!/usr/bin/env perl
#use v5.36;

use feature 'say';

say $_ for glob join "",map "{".qw(-,@ ABC DEF GHI JKL MNO PQRS TUV WXYZ)[$_-1]=~s/\B/,/gr."}", ($ARGV[0] || '249')=~/./g
