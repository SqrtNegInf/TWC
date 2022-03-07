#!/usr/bin/env raku
use v6;

# run <script> <space-separated numbers>

say ([\+] <10 20 30 40 50 60 70 80 90 100>.map(*.Num)) Z/ (1..*);
