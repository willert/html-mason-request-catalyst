use Test::More;
use Test::Moose;

use FindBin;
use lib "$FindBin::Bin/../lib";

sub use_ok_or_bail($) {
  use_ok $_[0] or BAIL_OUT( "Failed to load essential module $_[0]" );
}

use_ok_or_bail 'HTML::Mason::Request::Moosified';
use_ok_or_bail 'MasonX::RequestContext::Catalyst';
use_ok_or_bail 'HTML::Mason::Request::Catalyst';

meta_ok 'MasonX::RequestContext::Catalyst',
  'MasonX::RequestContext::Catalyst has meta';
meta_ok 'HTML::Mason::Request::Catalyst',
  'HTML::Mason::Request::Catalyst has meta';

does_ok 'HTML::Mason::Request::Catalyst',
  'MasonX::RequestContext::Catalyst',
  'HTML::Mason::Request::Catalyst does trait';

has_attribute_ok 'HTML::Mason::Request::Catalyst', 'catalyst_ctx',
  'HTML::Mason::Request::Catalyst has a catalyst_ctx attribute';

done_testing();
