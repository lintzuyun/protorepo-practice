OUT = ./protorepo-${PROJECT}-go-practice
PACKAGE_PREFIX = github.com/lintzuyun
MODULE = ${PACKAGE_PREFIX}/protorepo-${PROJECT}-go-practice

.PHONY: install-proto build user

install-proto:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

user: PROJECT = user
user: VERSION = v1
user:
	rm -rf ${OUT}
	git clone git@github.com:lintzuyun/protorepo-${PROJECT}-go-practice.git ${OUT}
	protoc --go_out=${OUT}/${VERSION} --go_opt=module=${MODULE}/${VERSION} --go-grpc_out=${OUT}/${VERSION} --go-grpc_opt=module=${MODULE}/${VERSION} ${PROJECT}/${VERSION}/${PROJECT}.proto

build: install-proto user