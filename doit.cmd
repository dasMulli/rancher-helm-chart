helm package panda .\panda\
helm package infra .\infra\
helm package portal .\portal\

helm repo index --url https://vandenbergen.github.io/rancher-helm-chart/ --merge index.yaml .
git add -A
set mydate=grafana-helm_%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%_%time:~3,2%_%time:~6,2%
git commit -am %mydate%
git push