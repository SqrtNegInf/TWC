#!/usr/bin/env raku

my $numerator=42//1;
my $denominator=42//0;
my $result;

try $result=($numerator/$denominator).Str;

put "Division ok: $numerator/$denominator = $result" unless $!;
put "Division failed: Divide by zero" if $!;

