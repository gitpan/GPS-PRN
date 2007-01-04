#!/usr/bin/perl -w
# -*- perl -*-

#
# $Id: base.t,v 0.1 2006/02/21 eserte Exp $
# Author: Michael R. Davis
#

=head1 Test Examples

base.t - Good examples concerning how to use this module

=cut

use strict;
use lib q{lib};
use lib q{../lib};
use constant NEAR_DEFAULT => 7;

sub near {
  my $x=shift();
  my $y=shift();
  my $p=shift()||NEAR_DEFAULT;
  if (($x-$y)/$y < 10**-$p) {
    return 1;
  } else {
    return 0;
  }
}


BEGIN {
    if (!eval q{
	use Test;
	1;
    }) {
	print "1..0 # tests only works with installed Test module\n";
	exit;
    }
}

BEGIN { plan tests => 21 }

# just check that all modules can be compiled
ok(eval {require GPS::PRN; 1}, 1, $@);

use GPS::PRN;
my $obj = GPS::PRN->new();
ok(ref $obj, "GPS::PRN");

ok($obj->prn_oid(22231), "01");
ok($obj->prn_oid("22231"), "01");
ok($obj->oid_prn(1), 22231);
ok($obj->oid_prn("1"), 22231);
ok($obj->oid_prn("01"), 22231);
ok($obj->oid_prn(1), "22231");
ok($obj->prn_oid(22231), "01");

ok($obj->prn_oid(29486), 31);
ok($obj->oid_prn(31), 29486);

ok($obj->overload(12345, 123), "added");
ok($obj->prn_oid(12345), 123);
ok($obj->oid_prn(123), 12345);

ok($obj->overload(22231, 222), "overloaded");
ok($obj->prn_oid(22231), 222);
ok($obj->oid_prn(222), 22231);
$obj->reset;
ok($obj->prn_oid(22231), "01");

#ok($obj->overload(22222=>undef()), undef());

my $list=$obj->listprn;
ok(ref($list), "ARRAY");

$list=$obj->listoid;
ok(ref($list), "ARRAY");

my @listprn=$obj->listprn;
my @listoid=$obj->listoid;
ok(scalar(@listprn), scalar(@listoid));
