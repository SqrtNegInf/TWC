#!/usr/bin/env perl

($_ + reverse) =~ /^[13579]+$/ and print"$_\n" for 1..99;
