#! /bin/bash

# ./generate_side_navigation.sh

template_file="side_navigation_template.html"

new_out_file_tmp="side_navigation.html_tmp"
new_out_file="side_navigation.html"

cat >> ${new_out_file_tmp} <<- EOM

---
layout: default
---

	    
EOM
	

# retrieve the categories from topics folder
all_cat_folds=$( ( find ../topics -maxdepth 1 -mindepth 1 -type d ) )

for fold in ${all_cat_folds[@]}; do
	mycat=`basename $fold`
	echo $mycat
	
	tmp_all_post_tags=$( ( cat $fold/_posts/*md | grep tags | cut -f 2 -d" "  | sed 's/\[//g' | sed 's/\]//g' ))  # each element of the array is coma-sep list of tags for each posts
	
	
	all_post_tags=$(echo $tmp_all_post_tags | tr "," "\n")  #  replace the coma separated
	
	singletonArr=();   # build a table with each entry of the array is a single tag
	for tag in ${all_post_tags[@]}; do
		singletonArr=(${singletonArr[@]} $tag)
	done
	
	noDupArr=(); while IFS= read -r -d '' x; do noDupArr+=("$x"); done < <(printf "%s\0" "${singletonArr[@]}" | sort -uz)  # remove duplicated tags
	
	for unique_tag in ${noDupArr[@]}; do
		echo $unique_tag
	done
	
	tmp_tag_list="${noDupArr[*]}"
	tag_list="${tmp_tag_list//${IFS:0:1}/,}"
	echo $tag_list

	
	cat >> ${new_out_file_tmp} <<- EOM
{% if page.category == "$mycat" %}   
{% assign all_tags = "$tag_list" | split: ',' %}
{% assign folder = "$mycat" %}
	EOM
	
done

cat $new_out_file_tmp $template_file >> $new_out_file
rm -f $new_out_file_tmp

echo "... written: $new_out_file"
