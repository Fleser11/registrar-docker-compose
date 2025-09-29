

docker load -i registrar-backend.tar
docker load -i registrar-mongo.tar
docker load -i registrar-frontend.tar


docker-compose up -d

sleep 15

curl -X POST \
  http://localhost:8080/audits \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d @"./audits/SCS22022.audit.json"

echo "📤 Loading GenEd audit..."
curl -X POST \
  http://localhost:8080/audits \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d @"./audits/GenEd.audit.json"



