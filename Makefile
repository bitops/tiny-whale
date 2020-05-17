
run:
	docker run -p 8080:8080 "$$(docker build . | grep 'Successfully built' | awk '{print $$3}')"

build:
	docker build --build-arg GITHASH=$$(git rev-parse head) -t bitops/tinywhale:latest .

push: build
	docker push bitops/tinywhale:latest
