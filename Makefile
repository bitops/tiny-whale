
run:
	docker run -e "COLOR=$$COLOR" -p 8080:8080 "$$(docker build . | grep 'Successfully built' | awk '{print $$3}')"

build:
	docker build --build-arg GITHASH=$$(git rev-parse head) -t bitops/tinywhale:latest .

push: build
	docker push bitops/tinywhale:latest

container-version:
	docker exec -it $$(docker ps | grep tinywhale | awk '{print $$1}') cat /version.txt

code-version:
	git rev-parse head

diff: container-version code-version
