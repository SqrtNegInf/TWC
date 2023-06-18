#!/usr/bin/env perl
use v5.36;

sub expand {
    my ($string) = @_;
    $string =~ / \{(.+)\} /msx;
 
    return map {
        (my $expansion = $string) =~ s/\{(.+)\}/$_/msx;
        $expansion;
    } split /,\s*/, $1;
}

say for expand('Perl {Daily,Weekly,Monthly,Yearly} Challenge');
