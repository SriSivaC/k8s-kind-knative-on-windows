$env:KNATIVE_VERSION="0.24.0"

Invoke-WebRequest https://github.com/knative/serving/releases/download/v$env:KNATIVE_VERSION/serving-crds.yaml -OutFile serving-crds.yaml
kubectl apply -f serving-crds.yaml
# kubectl wait --for=condition=Established --all crd
Write-Output "sleeping for 15sec"
Start-Sleep 15
Write-Output "Awake"

Invoke-WebRequest https://github.com/knative/serving/releases/download/v$env:KNATIVE_VERSION/serving-core.yaml -OutFile serving-core.yaml
kubectl apply -f serving-core.yaml

Write-Output "sleeping for 15secs"
Start-Sleep 15
Write-Output "Awake"
# kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-serving > /dev/null



# -------------

# kn service create hello `
# --image gcr.io/knative-samples/helloworld-go `
# --port 8080 `
# --env TARGET=World `
# --revision-name=world

# -------------
$env:KNATIVE_NET_KOURIER_VERSION="0.24.0"

# -----------
Invoke-WebRequest https://github.com/knative/net-kourier/releases/download/v$env:KNATIVE_NET_KOURIER_VERSION/kourier.yaml -OutFile kourier.yaml
kubectl apply -f kourier.yaml
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n kourier-system
kubectl wait pod --timeout=-1s --for=condition=Ready -l '!job-name' -n knative-serving
# ---------
$EXTERNAL_IP="127.0.0.1"
# ------------
$KNATIVE_DOMAIN="$EXTERNAL_IP.nip.io"
Write-Output KNATIVE_DOMAIN=$KNATIVE_DOMAIN
# =---------------
# dig $KNATIVE_DOMAIN
# --------------  {"data": {"127.0.0.1.nip.io": ""}}
# kubectl patch configmap -n knative-serving config-domain -p "{`"data`": {`"$KNATIVE_DOMAIN`": `"`"}}"
kubectl apply -f .\serving-domain-config.yaml
# -------------------------
kubectl apply -f .\kourier-config.yaml
      # ----------------------
kubectl apply -f .\network-config.yaml

Write-Output "sleeping for 15secs"
Start-Sleep 15
Write-Output "Awake"


