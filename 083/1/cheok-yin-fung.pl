#!/usr/bin/env perl

print "OK only for very limited inputs\n";
$_ = 'This is very old school Perl code';
/(^\w+\s)([\w\s*]+)(\s\w+$)/;
$_ = $2;
s/\s//g;
print length, "\n";

print "fails with punctuation (no result)\n";
$_ = 'This is very old-school Perl code.';
/(^\w+\s)([\w\s*]+)(\s\w+$)/;
$_ = $2;
s/\s//g;
print length, "\n";


print "fails with multi-byte (no result)\n";
$_ = 'Markmið lífs okkar er að vera hamingjusöm';
/(^\w+\s)([\w\s*]+)(\s\w+$)/;
$_ = $2;
s/\s//g;
print length, "\n";

