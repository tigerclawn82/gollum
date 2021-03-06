.PHONY: all clean freebsd linux mac pi win current restore test
clean:
	@rm -f ./gollum
	@rm -f ./gollum_*.zip

linux:
	@echo "Building for Linux"
	@GOOS=linux GOARCH=amd64 go build -o gollum
	@zip gollum_linux.zip gollum config

mac:
	@echo "Building for MacOS X"
	@GOOS=darwin GOARCH=amd64 go build -o gollum
	@zip gollum_mac.zip gollum config

freebsd:
	@echo "Building for FreeBSD"
	@GOOS=freebsd GOARCH=amd64 go build -o gollum
	@zip gollum_freebsd.zip gollum config

win:
	@echo "Building for Windows"
	@GOOS=windows GOARCH=amd64 go build -o gollum
	@zip gollum_win.zip gollum config

pi:
	@echo "Building for Raspberry Pi"
	@GOOS=linux GOARCH=arm go build -o gollum
	@zip gollum_pi.zip gollum config

current:
	@go build

restore:
	@go get github.com/tools/godep
	@godep restore

test:
	@go test -v ./...

all: clean freebsd linux mac pi win current

.DEFAULT_GOAL := current
