#!/usr/bin/make -f

### Script: makefile
##
## ファイルを作成する。
##
## Metadata:
##
##   id - d47127c3-3d08-4f7c-942a-2c1757cf77ec
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 1.0.0
##   date - 2024-06-06
##   since - 2024-06-06
##   copyright - Copyright (C) 2024-2024 qq542vev. Some rights reserved.
##   license - <CC-BY at https://creativecommons.org/licenses/by/4.0/>
##   package - danbooru-mannequin-head
##
## See Also:
##
##   * <Project homepage at https://github.com/qq542vev/danbooru-mannequin-head>
##   * <Bag report at https://github.com/qq542vev/danbooru-mannequin-head/issues>

# Macro
# =====

VERSION = 1.0.0

.POSIX:

.PHONY: all clean help version

all: template.pdf

template.pdf: template.fodg
	soffice --headless --convert-to pdf '${<}'

# Clean
# =====

clean:
	rm -rf -- template.pdf

# Message
# =======

help:
	@echo 'ファイルを作成する。'
	@echo
	@echo 'USAGE:'
	@echo '  make [OPTION...] [TARGET...]'
	@echo
	@echo 'TARGET:'
	@echo '  all     全てのファイルを作成する。'
	@echo '  clean   作成したファイルを削除する。'
	@echo '  help    このヘルプを表示して終了する。'
	@echo '  version バージョン情報を表示して終了する。'

version:
	@echo '${VERSION}'
