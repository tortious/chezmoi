nothing:

.PHONY: html-coverage
html-coverage:
	go tool cover -html=coverage.out

.PHONY: coverage.out
coverage.out:
	go test -cover -covermode=count -coverprofile=cmd-coverage.out -coverpkg=github.com/twpayne/chezmoi/cmd,github.com/twpayne/chezmoi/lib/chezmoi ./cmd
	go test -cover -covermode=count -coverprofile=lib-chezmoi-coverage.out ./lib/chezmoi
	gocovmerge cmd-coverage.out lib-chezmoi-coverage.out > $@ || ( rm $@ ; false )