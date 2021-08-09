git clone https://github.com/knative/client.git
Set-Location client/
$env:GO111MODULE="on"
go mod vendor
go build -mod=vendor -o kn.exe .\cmd\...
Set-Location ..
Move-Item .\client\kn.exe .\kn.exe
Remove-Item -r client/