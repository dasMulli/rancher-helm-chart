helm package panda .\panda\
helm repo index --url https://vandenbergen.github.io/rancher-helm-chart/ --merge index.yaml .
git add -A
git commit -am "grafana-helm"
git push