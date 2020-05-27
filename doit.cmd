REM cd portal
REM helm dependency update
REM helm dependency build
REM cd ..
helm package portal .\portal\

REM cd panda
REM helm dependency update
REM helm dependency build
REM cd ..
helm package panda .\panda\

cd infra
helm dependency update
helm dependency build
cd ..
helm package infra .\infra\


for /f "skip=5 eol=: delims=" %%F in ('dir /b /o-d panda*.tgz') do @del "%%F"
for /f "skip=5 eol=: delims=" %%F in ('dir /b /o-d infra*.tgz') do @del "%%F"
for /f "skip=5 eol=: delims=" %%F in ('dir /b /o-d portal*.tgz') do @del "%%F"
del index.yaml

helm repo index --url https://vandenbergen.github.io/rancher-helm-chart/ --merge index.yaml .
git add -A
set NantTime=%time: =0%
set mydate=grafana-helm_%date:~6,4%-%date:~3,2%-%date:~0,2%_%NantTime:~0,2%_%NantTime:~3,2%_%NantTime:~6,2%
echo %mydate%
git commit -am %mydate%
git push