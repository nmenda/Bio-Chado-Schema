package Chado::Schema::Cv::Cvtermpath;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("cvtermpath");
__PACKAGE__->add_columns(
  "cvtermpath_id",
  {
    data_type => "integer",
    default_value => "nextval('cvtermpath_cvtermpath_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "subject_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "object_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "cv_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "pathdistance",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("cvtermpath_id");
__PACKAGE__->add_unique_constraint("cvtermpath_pkey", ["cvtermpath_id"]);
__PACKAGE__->add_unique_constraint(
  "cvtermpath_c1",
  ["subject_id", "object_id", "type_id", "pathdistance"],
);
__PACKAGE__->belongs_to(
  "type_id",
  "Chado::Schema::Cv::Cvterm",
  { cvterm_id => "type_id" },
);
__PACKAGE__->belongs_to(
  "object_id",
  "Chado::Schema::Cv::Cvterm",
  { cvterm_id => "object_id" },
);
__PACKAGE__->belongs_to(
  "subject_id",
  "Chado::Schema::Cv::Cvterm",
  { cvterm_id => "subject_id" },
);
__PACKAGE__->belongs_to("cv_id", "Chado::Schema::Cv::Cv", { cv_id => "cv_id" });


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4N1p8Xi7Rawc1t8bxXnwVQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
