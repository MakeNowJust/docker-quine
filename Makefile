# Dockerファイルをビルドするための設定

.PHONY: quine

# .dockerディレクトリにダミーのファイルを保存して、docker buildする

.docker:
	mkdir -p .docker

.docker/% : %/Dockerfile .docker
	docker build $(DOCKER_BUILD_FLAGS) -t quine-$(@:.docker/%=%) $(<D)
	touch $@

# quineだけは特殊

.docker/quine: Dockerfile .docker
	docker build $(DOCKER_BUILD_FLAGS) -t quine .
	touch $@

# その他の*.dockerfileについて

dockerfiles = $(foreach docker,$(wildcard */Dockerfile),$(docker:%/Dockerfile=%))
define dockerfile-rule
$1: .docker/$1
endef
$(foreach docker,$(dockerfiles), \
	$(eval $(call dockerfile-rule,$(docker))))
