# How to deploy to Cloud Run
This process is split in two steps. Build a docker image in gcr and deploy it to cloud run.

Build docker image and push it to gcr:
```bash
gcloud builds submit --tag gcr.io/trukatu-dev-1/items
```

Deploy the service:
```bash
gcloud beta run deploy items --image gcr.io/trukatu-dev-1/items --platform managed --region europe-west1 --allow-unauthenticated --set-env-vars=APP_PROFILE="DEV"
```  