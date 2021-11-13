complete -f -c klf --arguments "(kubectl get pods | tail -n +2 | awk '{print \$1}')"

