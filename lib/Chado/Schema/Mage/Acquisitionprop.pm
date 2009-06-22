package Chado::Schema::Mage::Acquisitionprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("acquisitionprop");
__PACKAGE__->add_columns(
  "acquisitionprop_id",
  {
    data_type => "integer",
    default_value => "nextval('acquisitionprop_acquisitionprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "acquisition_id",
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
__PACKAGE__->set_primary_key("acquisitionprop_id");
__PACKAGE__->add_unique_constraint("acquisitionprop_pkey", ["acquisitionprop_id"]);
__PACKAGE__->add_unique_constraint("acquisitionprop_c1", ["acquisition_id", "type_id", "rank"]);
__PACKAGE__->belongs_to(
  "acquisition_id",
  "Chado::Schema::Mage::Acquisition",
  { acquisition_id => "acquisition_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n07aWvIut9RT04Sq3dBKSg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
