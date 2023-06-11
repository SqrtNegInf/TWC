#!/usr/bin/env perl
use v5.36;

#One liner solution. I believe the conditions can be simplified, but I decided to keep it this way so that it 
#Clearly reflects the conditions mentioned in the task description
!(/a[^ei]/ || /e[^i]/ || /i[^aeou]/ || /o[^au]/ || /u[^oe]/) && say for glob "{a,e,i,o,u}" x ($ARGV[0]||3);
