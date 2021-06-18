# Remove the .git folder
sudo rm -r .git
git init

# Make first commit
hugo
git add .
git commit -m "Initial Commit"
git branch -M main

# Create the gh-pages branch 
git branch gh-pages
git checkout gh-pages

# Remove everything other than public
rm -r archetypes/ content/ resources/ static/ themes/ config.toml deploy.sh README.md

cp -r public/* .
sudo rm -r public/

git add .
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

git push origin gh-pages