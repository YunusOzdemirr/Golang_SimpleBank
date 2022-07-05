postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres
createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank  
dropdb:
	docker exec -it postgres dropdb  simple_bank  
migrateup:
	migrate -path data/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up
migratedown:
	migrate -path data/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate 
# dockerStop:
#   docker stop postgres
# dockerRemove:
# 	docker rm postgres
# dockerList:
# 	docker ps -a

.PHONY: postgres createdb dropdb migrateup migratedown