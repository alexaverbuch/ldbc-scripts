#!/bin/sh
# Create new regular & merge versions of dataset for use in validation and integration tests. 
# Copy datasets to Neo4j LDBC connector resources directory
data_gen_dir=/Users/alexaverbuch/IdeaProjects/ldbc_snb_datagen
scripts_dir=/Users/alexaverbuch/IdeaProjects/ldbc-scripts
connector_dir=/Users/alexaverbuch/IdeaProjects/ldbc-load-generator/ldbc_snb_workload_interactive_neo4j
validation_set_dir=${connector_dir}/data-import/src/test/resources/validation_sets/business_intelligence/neo4j
parameters_dir=${data_gen_dir}/substitution_parameters
hadoop_dir=/Users/alexaverbuch/hadoopTempDir/output/social_network

# --- DELETE OLD validation-related directories ---
rm -rf ${validation_set_dir}
mkdir ${validation_set_dir}

# --- RECONSTRUCT directories ---
mkdir ${validation_set_dir}/substitution_parameters/
mkdir ${validation_set_dir}/social_network/
mkdir ${validation_set_dir}/social_network/string_date/
mkdir ${validation_set_dir}/social_network/num_date/
mkdir ${validation_set_dir}/merge/
mkdir ${validation_set_dir}/merge/social_network/
mkdir ${validation_set_dir}/merge/social_network/string_date/
mkdir ${validation_set_dir}/merge/social_network/num_date/

# --- CREATE REGULAR STRING DATE CSV files ---
rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/BI___params_regular_string_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY REGULAR STRING DATE files to connector ---
cp ${data_gen_dir}/params.ini ${validation_set_dir}/ 
cp ${parameters_dir}/q0* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q1* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q2* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q3* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q4* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q5* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q6* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q7* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q8* ${validation_set_dir}/substitution_parameters/
cp ${parameters_dir}/q9* ${validation_set_dir}/substitution_parameters/
cp ${hadoop_dir}/* ${validation_set_dir}/social_network/string_date/
rm ${validation_set_dir}/social_network/string_date/updateStream*

# --- CREATE REGULAR NUMBER DATE CSV files ---
rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/BI___params_regular_num_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY REGULAR NUMBER DATE files to connector ---
cp ${hadoop_dir}/* ${validation_set_dir}/social_network/num_date/
rm ${validation_set_dir}/social_network/num_date/updateStream*

# --- CREATE MERGE STRING files ---
rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/BI___params_merge_string_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY MERGE STRING files to connector ---
cp ${hadoop_dir}/*.csv ${validation_set_dir}/merge/social_network/string_date/
rm ${validation_set_dir}/merge/social_network/string_date/updateStream*

# --- CREATE MERGE NUMBER files ---
rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/BI___params_merge_num_date.ini ${data_gen_dir}/params.ini
cd ${data_gen_dir}
bash ${data_gen_dir}/run.sh

# --- COPY MERGE STRING files to connector ---
cp ${hadoop_dir}/*.csv ${validation_set_dir}/merge/social_network/num_date/
rm ${validation_set_dir}/merge/social_network/num_date/updateStream*

# --- COPY REGULAR data generator configuration file back to data generator directory ---
rm ${data_gen_dir}/params.ini
cp ${scripts_dir}/BI___params_regular_string_date.ini ${data_gen_dir}/params.ini