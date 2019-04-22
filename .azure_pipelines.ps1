Write-Output "Prepare Azure Git Instance"
git config --global credential.helper store
Add-Content "$HOME\.git-credentials" "https://$($env:github_access_token):x-oauth-basic@github.com`n"
git config --global user.email $($env:github_email)
git config --global user.name "Foxtrek64"
git config http.postBuffer 524288000

Write-Output "Cloning the repo with the gh-pages branch"
git clone https://github.com/LuzFaltex/docs.git --branch gh-pages site

Write-Output "Clear repo directory"
Set-Location site
git rm -r *

Write-Output "Copy documentation into the repo"
Copy-Item -Path ../docs/_site/* -Destination . -Recurse

Write-Output "Build CNAME doc"
Set-Content -Path "./CNAME" -Value "docs.luzfaltex.com`r`n"

Write-Output "Push the new docs to the remote branch"
git add .
git commit -m "$(Build.SourceVersionMessage)"
git push -f origin gh-pages