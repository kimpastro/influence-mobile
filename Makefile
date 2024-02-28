up:
	docker-compose up -d && \
	docker-compose exec web_app rake db:create db:migrate db:seed

stop:
	docker-compose stop

clean:
	docker-compose stop && \
	docker-compose rm -f && \
	docker volume rm influence_mobile_pg_data && \
	docker image rm influence-mobile
