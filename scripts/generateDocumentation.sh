#!/bin/bash

# Generates documentation and then copies it to the apropriate sites folder

BASE_PATH=~/Documents/Developer/StraboGIS
DOCS_PATH=$BASE_PATH/Documentation/Toast
ORIGIN_PATH=$BASE_PATH/Toast/Toast
DESTINATION_PATH=~/Sites/doc.strabogis.com/generated_docs/mobile/toastapp

appledoc $ORIGIN_PATH

# Prepare to copy documents

echo "Copying documents to the proper location for web upload"

# Delete any old documents in the destination

rm -rf $DESTINATION_PATH

# Now copy the apropriate files

cp -r $DOCS_PATH $DESTINATION_PATH

# Echo a completion message                                                                                                    

echo "Documents copied to "$DESTINATION_PATH
