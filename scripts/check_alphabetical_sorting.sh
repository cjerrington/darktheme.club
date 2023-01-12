# Returns a non-zero exit code if the data sites are not alphabetically sorted.

#grep 'domain:' _data/sites.yml | tr '[:upper:]' '[:lower:]' | sort -c

yq 'sort_by(.domain)' _data/sites.yml > _data/sorted.yml

rm _data/sites.yml
mv _data/sorted.yml _data/sites.yml

git add .
git diff
git config --global user.email "github-action-bot@example.com"
git config --global user.name "GitHub Action Bot"
git commit -m "_data/sites.yml" -a || echo "No changes to commit"
git push