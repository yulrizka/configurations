complete -f -c kbash --arguments "(kubectl get pods | tail -n +2 | awk '{print \$1}')"

