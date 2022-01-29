#!/usr/bin/perl -w

use strict;
use warnings;

my @lines = ();
my $comment = "/// ";
my $start = 0;

push @lines, "$comment```dart\n";

while(my $line = <STDIN>) {
  if ($start) {
    last if $line =~ /^}/;
    $line=~ s/^\s+// unless $line =~ /^$/;
    push @lines, "$comment$line";
  }
  if ($line =~ /^void main/) {
    $start = 1;
    next;
  }
}

push @lines, "$comment```\n";

print $_ foreach @lines;
