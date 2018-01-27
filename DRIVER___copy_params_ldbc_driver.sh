#!/bin/sh
parameters_dir=/Users/alexaverbuch/IdeaProjects/ldbc_snb_datagen/substitution_parameters
update_stream_dir=/Users/alexaverbuch/hadoopTempDir/output/social_network
driver_interactive_dir=/Users/alexaverbuch/IdeaProjects/ldbc/ldbc_driver/src/test/resources/snb/interacive
driver_bi_dir=/Users/alexaverbuch/IdeaProjects/ldbc/ldbc_driver/src/test/resources/snb/bi

cp ${parameters_dir}/q1* ${driver_bi_dir}
cp ${parameters_dir}/q2* ${driver_bi_dir}
cp ${parameters_dir}/q3* ${driver_bi_dir}
cp ${parameters_dir}/q4* ${driver_bi_dir}
cp ${parameters_dir}/q5* ${driver_bi_dir}
cp ${parameters_dir}/q6* ${driver_bi_dir}
cp ${parameters_dir}/q7* ${driver_bi_dir}
cp ${parameters_dir}/q8* ${driver_bi_dir}
cp ${parameters_dir}/q9* ${driver_bi_dir}

cp ${parameters_dir}/query_* ${driver_interactive_dir}
cp ${update_stream_dir}/update* ${driver_interactive_dir}