git init .
git add .
read -p "Entrer le message du commit: " commit_message
git commit -m "$commit_message"
git branch -M master
git remote add origin https://github.com/tizibienvenus/rest_api_with_provider.git
git push --set-upstream origin master
##git push