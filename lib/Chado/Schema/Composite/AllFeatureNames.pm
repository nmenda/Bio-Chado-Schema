package Chado::Schema::Composite::AllFeatureNames;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("all_feature_names");
__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "organism_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lRmcky3r2SFfI/sHbgp2WQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
