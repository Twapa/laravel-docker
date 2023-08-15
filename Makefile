setup:
	@make build
	@make up 
	@make composer-update
build:
	docker-compose build --no-cache --force-rm
stop:
	docker-compose stop
up:
	docker-compose up -d
composer-update:
	docker exec laravel-docker-app bash -c "composer update"
data:
	docker exec laravel-docker-app bash -c "php artisan migrate --force"
	docker exec laravel-docker-app bash -c "php artisan db:seed --class=CustomSeeder --no-interaction"

cd:	
	docker exec -it laravel-docker-app bash