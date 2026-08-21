helm repo add argo https://argoproj.github.io/argo-helm
helm install my-argo-cd argo/argo-cd --version 10.3.2 -f helm_values.yaml


kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d