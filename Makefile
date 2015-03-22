# Dockerファイルをビルドするための設定

.PHONY: quine

# .dockerディレクトリにダミーのファイルを保存して、docker buildする

.docker:
	mkdir -p .docker

.docker/% : %.dockerfile .docker
	docker build $(DOCKER_BUILD_FLAGS) -t quine-$(@:.docker/%=%) -f $< .
	touch $@

# quineだけは特殊

.docker/quine: Dockerfile .docker
	docker build $(DOCKER_BUILD_FLAGS) -t quine .
	touch $@

# その他の*.dockerfileについて

define dockerfile-rule
$1: quine .docker/$1
endef
dockerfiles = $(wildcard *.dockerfile)
$(foreach docker, $(dockerfiles), \
  $(eval $(call dockerfile-rule,$(docker:%.dockerfile=%))))
