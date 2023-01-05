test:
	docker build -f Dockerfile.server -t server-image . 
	docker run -p 5000:5000 -d --name webserver server-image
	docker build -f Dockerfile.test -t test-image .
	docker run --network host test-image  robot -d result --variable url:http://localhost:5000 API_Test.robot
	docker kill webserver
