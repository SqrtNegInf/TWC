#!/usr/bin/env perl
use v5.36;

print(($_%3?"":"Fizz").($_%5?"":"Buzz")||$_,"\n") for 1..20;
