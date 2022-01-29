#!/usr/bin/perl -w

use strict;
use warnings;

my @lines = ();
my $comment = "/// ";
my $start = 0;

push @lines, "$comment```dart\n";

while(my $line = <STDIN>) {
  if ($line =~ /^void main/) {
    $start = 1;
    next;
  }

  if ($start) {
    last if $line =~ /^}/;
    $line =~ s/^\s+// unless $line =~ /^$/;
    $line = "$comment$line";
    $line =~ s/\/\s$/\//; # removes trailing space
    push @lines, $line;
  }
}

push @lines, "$comment```\n";

print $_ foreach @lines;
