use Test::More;
use Test::Moose;

use FindBin;
use lib "$FindBin::Bin/../lib";

use_ok 'MasonX::TraitFor::Request::Catalyst::Context';
use_ok 'HTML::Mason::Request::Catalyst';

meta_ok 'MasonX::TraitFor::Request::Catalyst::Context',
  'MasonX::TraitFor::Request::Catalyst::Context has meta';
meta_ok 'HTML::Mason::Request::Catalyst',
  'HTML::Mason::Request::Catalyst has meta';

does_ok 'HTML::Mason::Request::Catalyst',
  'MasonX::TraitFor::Request::Catalyst::Context',
  'HTML::Mason::Request::Catalyst does trait';

has_attribute_ok 'HTML::Mason::Request::Catalyst', 'catalyst_ctx',
  'HTML::Mason::Request::Catalyst has a catalyst_ctx attribute';

done_testing();
