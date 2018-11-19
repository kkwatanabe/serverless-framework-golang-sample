run:
	dep ensure -v
	gomon line-bot -- env GOOS=linux go build -ldflags="-s -w" -o bin/line-bot line-bot/*.go

build:
	go fmt line-bot/*.go
	dep ensure -v
	env GOOS=linux go build -ldflags="-s -w" -o bin/line-bot line-bot/*.go

.PHONY: clean
clean:
	rm -rf ./bin ./vendor Gopkg.lock

.PHONY: deploy
deploy: clean build
	sls deploy --verbose --stage ${stage} --aws-profile ${profile}
