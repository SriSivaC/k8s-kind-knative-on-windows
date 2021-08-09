helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install dashboard kubernetes-dashboard/kubernetes-dashboard -n kubernetes-dashboard --create-namespace

Write-Output "sleeping for 15secs"
Start-Sleep 15
Write-Output "Awake"

kubectl apply -f .\serviceaccount-adminuser.yaml

Write-Output "sleeping for 15secs"
Start-Sleep 15
Write-Output "Awake"

kubectl apply -f .\dashboard-adminuser.yaml

Write-Output "sleeping for 15secs"
Start-Sleep 15
Write-Output "Awake"

kubectl -n kubernetes-dashboard get `
 secret $(kubectl -n kubernetes-dashboard get `
 sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}" > secret.txt