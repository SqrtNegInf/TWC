#!/usr/bin/env perl
print(($_%3?"":"Fizz").($_%5?"":"Buzz")||$_,"\n") for 1..20;
