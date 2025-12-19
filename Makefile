.PHONY: help build up down logs clean test-api frontend backend


help:
@echo "Commandes disponibles:"
@echo " make build - Construire les images Docker"
@echo " make up - Démarrer les conteneurs"
@echo " make down - Arrêter les conteneurs"
@echo " make logs - Afficher les logs"
@echo " make clean - Nettoyer tout"
@echo " make test-api - Tester l'API avec curl"
@echo " make frontend - Démarrer le frontend en dev"
@echo " make backend - Démarrer le backend en dev"


build:
docker-compose build


up:
docker-compose up -d


down:
docker-compose down


logs:
docker-compose logs -f


clean:
docker-compose down -v
docker system prune -af


test-api:
curl -X POST http://localhost:8080/api/auth/register \
-H "Content-Type: application/json" \
-d '{"email":"test@example.com","firstName":"Test","lastName":"User","password":"password123"}'


frontend:
cd frontend && npm start


backend:
cd backend && mvn spring-boot:run
