package Chado::Schema::Sequence::Featureprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featureprop");
__PACKAGE__->add_columns(
  "featureprop_id",
  {
    data_type => "integer",
    default_value => "nextval('featureprop_featureprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "rank",
  { data_type => "integer", default_value => 0, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("featureprop_id");
__PACKAGE__->add_unique_constraint("featureprop_pkey", ["featureprop_id"]);
__PACKAGE__->add_unique_constraint("featureprop_c1", ["feature_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "feature_id",
  "Chado::Schema::Sequence::Feature",
  { feature_id => "feature_id" },
);
__PACKAGE__->has_many(
  "featureprop_pubs",
  "Chado::Schema::Sequence::FeaturepropPub",
  { "foreign.featureprop_id" => "self.featureprop_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z2c+VuylhnvZ+J8+gezWPA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
