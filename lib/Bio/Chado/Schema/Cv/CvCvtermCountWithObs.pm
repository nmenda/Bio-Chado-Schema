package Bio::Chado::Schema::Cv::CvCvtermCountWithObs;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Bio::Chado::Schema::Cv::CvCvtermCountWithObs - per-cv terms counts (includes obsoletes)

=cut

__PACKAGE__->table("cv_cvterm_count_with_obs");

=head1 ACCESSORS

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 num_terms_incl_obs

  data_type: 'bigint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "name",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "num_terms_incl_obs",
  { data_type => "bigint", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07001 @ 2010-08-16 23:01:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EbB1ifDHWS7iWjrgzcEICw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
