helm package panda .\panda\
helm package infra .\infra\
helm package portal .\portal\

helm repo index --url https://vandenbergen.github.io/rancher-helm-chart/ --merge index.yaml .
git add -A
git commit -am "grafana-helm"
git push