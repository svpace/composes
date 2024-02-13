#!/usr/bin/env sh
set -eux

find "$(dirname "$0")" -type f -iname '*.json' \
| while read -r it; do
	echo "Applying $it..."
	curl \
		--fail-with-body \
		--silent \
		--retry 10 \
		--retry-connrefused \
		--request PUT \
		--header 'Accept: application/json' \
		--header 'Content-Type: application/json' \
		--data "@$it" \
		"connect:8083/connectors/$(basename "$it" ".json")/config"
done
