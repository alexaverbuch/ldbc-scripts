#!/bin/sh
# Create new regular & merge versions of dataset for use in validation and integration tests. 
# Copy datasets to Neo4j LDBC connector resources directory
data_gen_dir=/Users/alexaverbuch/IdeaProjects/ldbc_snb_datagen
scripts_dir=/Users/alexaverbuch/IdeaProjects/ldbc-scripts

rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/params_regular.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh
bash ${scripts_dir}/BI___copy_data_and_params_to_validation_set.sh 
rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/params_merge.ini ${data_gen_dir}/params.ini
bash ${data_gen_dir}/run.sh
bash ${scripts_dir}/BI___copy_merge_data_to_validation_set.sh
rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/params_regular.ini ${data_gen_dir}/params.ini