echo -e "\nUpdating to version $1\n"

new="## Release $1"

cat "./README.md" | while read line; do
if [[ "$line" =~ [\#]{2}\ Release\ v[0-9]{1}\.[0-9]{1}\.[0-9]{1,2}$ ]]; then
old="$line"
sed -i "s/$old/$new/g" "./README.md"
echo -e "From $old to $new" 
break
fi;
done