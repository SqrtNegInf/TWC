#!/usr/bin/env perl

use strict;
use warnings;
use YAML::XS qw(Dump);

foreach my $url ('jdbc:mysql://user:password@localhost:3306/pwc?profile=true#h1') {
  print Dump(urlparse($url));
}

sub urlparse {
  my ($url)=@_;
  my %match;
  if ($url =~ m!//!) {
    $url =~ m!^(?<scheme>.*?)://(?:(?:(?<userinfo>.*)@)?(?<host>[-_a-z0-9]+)(?::(?<port>[0-9]+))?)?(?<pqf>.*)!;
    map {$match{$_}=$+{$_}} keys %+;
  } else { # if no userinfo-host-port component, split on the last colon
    $url =~ m!^(?<scheme>.*):(?<pqf>[^:]*)!;
    map {$match{$_}=$+{$_}} keys %+;
  }
  $match{pqf} =~ m!(?<path>[^?#]*)(?:\?(?<query>[^#]*))?(?:\#(?<fragment>.*))?$!;
  map {$match{$_}=$+{$_}} keys %+;
  delete $match{pqf};
  return \%match;
}

