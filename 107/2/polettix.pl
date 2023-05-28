#!/usr/bin/env perl
use v5.36;

sub list_methods ($module) {
   no strict 'refs';
   return grep { defined &{$module . '::' . $_} } sort keys %{$module . '::'};
}

sub load ($module) { require("$module.pm" =~ s{::}{/}grmxs); $module }

use FindBin '$Bin';
use lib $Bin;;
my $module = shift // 'Calc';
say for list_methods(load($module));
