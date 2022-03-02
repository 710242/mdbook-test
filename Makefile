.PHONY: deploy
deploy: book
		@echo "====> deploying to github"
		mdbook build
		git worktree add /tmp/book gh-pages
		rm -rf /tmp/book/*
		cp -rp book/* /tmp/book/
		cd /tmp/book && \
				git add . && \
				git commit -m "deployed on $(shell date) by ${USER}" && \
				git push origin gh-pages
