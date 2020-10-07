#!/bin/bash

# ./prep_pages.sh

cd _layouts
./generate_side_navigation.sh
cd ../topics
./generate_topic_sidebar.sh
cd ..
