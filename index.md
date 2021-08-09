# Prerequesites

[golang] (https://golang.org/dl/)

[Windows Subsystem for Linux] (https://docs.microsoft.com/en-us/windows/wsl/install-win10)

[Docker Desktop with WSL] (https://docs.docker.com/docker-for-windows/wsl/)


##### Step 1
use install-kind.ps1 to install kind executable
add GOPATH to PATH environment variable which is usually, C:\Users\$env:USERNAME\go\bin
##### step 2
install kubectl following official guide from kubernetes

install helm from official helm page ( usually zip file release containing .exe)

place the exe files in a location and add them to PATH environment variable
##### step 3
build kind client using build-kind-client.ps1
##### step 4
install knative install-kind-knative.ps1
##### step 5
install knative serving kind-knative-serving-setup.ps1
##### step 6
install knative eventing kind-knative-eventing-setup.ps1
