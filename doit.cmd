helm package panda .\panda\
helm package infra .\infra\
helm package portal .\portal\

for /f "skip=5 eol=: delims=" %%F in ('dir /b /o-d panda*.tgz') do @del "%%F"
for /f "skip=5 eol=: delims=" %%F in ('dir /b /o-d infra*.tgz') do @del "%%F"
for /f "skip=5 eol=: delims=" %%F in ('dir /b /o-d portal*.tgz') do @del "%%F"

helm repo index --url https://vandenbergen.github.io/rancher-helm-chart/ --merge index.yaml .
git add -A
set mydate=grafana-helm_%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%
git commit -am %mydate%
git push