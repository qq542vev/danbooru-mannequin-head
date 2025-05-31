### File: Dockerfile
##
## Dockerイメージを作成する。
##
## Usage:
##
## ------ Text ------
## docker image build -f Dockerfile
## ------------------
##
## Metadata:
##
##   id - b2c6a487-88e6-4479-905e-dd07e8762407
##   author - <qq542vev at https://purl.org/meta/me/>
##   version - 1.0.2
##   created - 2025-05-23
##   modified - 2025-05-31
##   copyright - Copyright (C) 2025-2025 qq542vev. All rights reserved.
##   license - <GNU GPLv3 at https://www.gnu.org/licenses/gpl-3.0.txt>
##
## See Also:
##
##   * <Project homepage at https://gist.github.com/qq542vev/635e8c27c9c0b163b9dcebed80418dc1>

ARG BASE="docker.io/library/debian:12-slim"

FROM ${BASE}

ARG BASE
ARG TITLE="ダンボールマネキンヘッド"
ARG VERSION="1.0.2"
ARG WORKDIR="/work"

LABEL org.opencontainers.image.title="${TITLE}"
LABEL org.opencontainers.image.description="${TITLE}のビルド・テスト用のイメージ。"
LABEL org.opencontainers.image.authors="qq542vev <https://purl.org/meta/me/>"
LABEL org.opencontainers.image.version="${VERSION}"
LABEL org.opencontainers.image.url="https://github.com/qq542vev/danbooru-mannequin-head"
LABEL org.opencontainers.image.license="GPL-3.0-only"
LABEL org.opencontainers.image.base.name="${BASE}"

ENV LANG="C.UTF-8"
ENV TZ="Asia/Tokyo"

WORKDIR ${WORKDIR}

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		fonts-ipafont-gothic make libreoffice-draw && \
	apt-get clean && \
	rm -rf /var/lib/apt-get/lists/*

CMD ["make"]
