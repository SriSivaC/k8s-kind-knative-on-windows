$env:GO111MODULE="on"

go get sigs.k8s.io/kind@v0.11.1   
#or any official version available at https://kind.sigs.k8s.io/docs/user/quick-start/#installation

Write-Output "ADD THE FOLLOWING PATH TO PATH environment variable"
Write-Output "$(go env GOPATH)\bin"