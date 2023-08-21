postgres:
	docker run --name postgres13.3 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:13.3-alpine
createdb:
	docker exec -it postgres13.3 createdb --username=root --owner=root gobank

dropdb:
	docker exec -it postgres13.3 dropdb gobank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/gobank?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/gobank?sslmode=disable" -verbose down
.PHONY:postgres createdb dropdb migrateup migratedown