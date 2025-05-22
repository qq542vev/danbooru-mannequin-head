#!/usr/bin/make -f

### Script: makefile
##
## ファイルを作成する。
##
## Metadata:
##
##   id - d47127c3-3d08-4f7c-942a-2c1757cf77ec
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 1.2.0
##   date - 2024-06-06
##   since - 2025-05-22
##   copyright - Copyright (C) 2024-2025 qq542vev. Some rights reserved.
##   license - <CC-BY-4.0 at https://creativecommons.org/licenses/by/4.0/>
##   depends - soffice, xdg-open
##
## See Also:
##
##   * <Project homepage at https://github.com/qq542vev/danbooru-mannequin-head>
##   * <Bag report at https://github.com/qq542vev/danbooru-mannequin-head/issues>

# Sp Targets
# ==========

.POSIX:

.PHONY: all run clean rebuild help version

.SILENT: help version

# Macro
# =====

VERSION = 1.2.0
SOFFICE = soffice

# Build
# =====

all: template.pdf

template.pdf: template.fodg
	$(SOFFICE) --headless --convert-to pdf '$(<)'

# Run
# ===

run: all
	xdg-open template.pdf

# Clean
# =====

clean:
	rm -rf -- template.pdf

rebuild: clean all

# Message
# =======

help:
	echo 'ファイルを作成する。'
	echo
	echo 'USAGE:'
	echo '  make [OPTION...] [MACRO=VALUE...] [TARGET...]'
	echo
	echo 'MACRO:'
	echo '  SOFFICE sofficeのパス。'
	echo
	echo 'TARGET:'
	echo '  all     全てのファイルを作成する。'
	echo '  run     メインのファイルを開く。'
	echo '  clean   作成したファイルを削除する。'
	echo '  rebuild cleanの後にallを実行する。'
	echo '  help    このヘルプを表示して終了する。'
	echo '  version バージョン情報を表示して終了する。'

version:
	echo '$(VERSION)'
