#!/usr/bin/perl -w

=head1 NAME

example.pl - GPS::PRN simple example

=cut

use strict;
use lib qw{./lib ../lib};
use GPS::PRN;

my $obj = GPS::PRN->new();
foreach (1..32) {
  print "PRN: $_ => OID: ", $obj->oid_prn($_)||'', "\n";
}
foreach (22231) {
  print "OID: $_ => PRN: ", $obj->prn_oid($_)||'', "\n";
}
