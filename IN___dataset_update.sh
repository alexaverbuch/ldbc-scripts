#!/bin/sh
# Create new regular & merge versions of dataset for use in validation and integration tests. 
# Copy datasets to Neo4j LDBC connector resources directory
data_gen_dir=/Users/alexaverbuch/IdeaProjects/ldbc_snb_datagen
scripts_dir=/Users/alexaverbuch/IdeaProjects/ldbc-scripts
connector_dir=/Users/alexaverbuch/IdeaProjects/ldbc/neo4j-connectors
validation_set_dir=${connector_dir}/src/test/resources/validation_sets/interactive/neo4j
hadoop_dir=/Users/alexaverbuch/hadoopTempDir/output
social_network_dir=${hadoop_dir}/social_network
parameters_dir=${hadoop_dir}/substitution_parameters/

# --- DELETE OLD validation-related directories ---
rm -rf ${validation_set_dir}
mkdir ${validation_set_dir}

# --- RECONSTRUCT directories ---
mkdir ${validation_set_dir}/substitution_parameters/
mkdir ${validation_set_dir}/updates/
mkdir ${validation_set_dir}/social_network/
mkdir ${validation_set_dir}/social_network/string_date/
mkdir ${validation_set_dir}/social_network/num_date/
mkdir ${validation_set_dir}/merge/
mkdir ${validation_set_dir}/merge/social_network/
mkdir ${validation_set_dir}/merge/social_network/string_date/
mkdir ${validation_set_dir}/merge/social_network/num_date/

# --- CREATE REGULAR STRING DATE CSV files ---
rm -f ${data_gen_dir}/params.ini
cp ${scripts_dir}/IN___params_regular_string_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY REGULAR STRING DATE files to connector ---
mv ${data_gen_dir}/params.ini ${validation_set_dir}/ 
mv ${parameters_dir}/interactive_* ${validation_set_dir}/substitution_parameters/
mv ${social_network_dir}/updateStream* ${validation_set_dir}/updates/
mv ${social_network_dir}/* ${validation_set_dir}/social_network/string_date/

# --- CREATE MERGE STRING DATE CSV files ---
rm -f ${data_gen_dir}/params.ini
cp ${scripts_dir}/IN___params_merge_string_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY MERGE STRING DATE files to connector ---
rm -f ${social_network_dir}/updateStream*
mv ${social_network_dir}/* ${validation_set_dir}/merge/social_network/string_date/

# --- CREATE REGULAR NUMBER DATE CSV files ---
rm -f ${data_gen_dir}/params.ini
cp ${scripts_dir}/IN___params_regular_num_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY REGULAR NUMBER DATE files to connector ---
rm -f ${social_network_dir}/updateStream*
mv ${social_network_dir}/* ${validation_set_dir}/social_network/num_date/

# --- CREATE MERGE NUMBER DATE CSV files ---
rm -f ${data_gen_dir}/params.ini
cp ${scripts_dir}/IN___params_merge_num_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY MERGE NUMBER DATE files to connector ---
rm -f ${social_network_dir}/updateStream*
mv ${social_network_dir}/* ${validation_set_dir}/merge/social_network/num_date/

# --- COPY REGULAR data generator configuration file back to data generator directory ---
rm -f ${data_gen_dir}/params.ini
cp ${scripts_dir}/IN___params_regular_string_date.ini ${data_gen_dir}/params.ini