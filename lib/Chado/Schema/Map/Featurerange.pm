package Chado::Schema::Map::Featurerange;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("featurerange");
__PACKAGE__->add_columns(
  "featurerange_id",
  {
    data_type => "integer",
    default_value => "nextval('featurerange_featurerange_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "featuremap_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "leftstartf_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "leftendf_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "rightstartf_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "rightendf_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "rangestr",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("featurerange_id");
__PACKAGE__->add_unique_constraint("featurerange_pkey", ["featurerange_id"]);
__PACKAGE__->belongs_to(
  "featuremap_id",
  "Chado::Schema::Map::Featuremap",
  { featuremap_id => "featuremap_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:27
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CKFj6eVmwPzM62KlXvoHFA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
