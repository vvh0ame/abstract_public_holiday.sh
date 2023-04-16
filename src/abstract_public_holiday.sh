#!/bin/bash

api="https://holidays.abstractapi.com/v1"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function set_api_key() {
	# 1 - api_key: (string): <YOUR_UNIQUE_API_KEY>
	api_key=$1
}

function get_holidays() {
	# 1 - country: (string): <country>
	# 2 - year: (integer): <year - default: current year>
	# 3 - month: (integer): <month>
	# 4 - day: (integer): <day>
	curl --request GET \
		--url "$api?api_key=$api_key&country=${1}&year=${2:-$(date +%Y)}&month=${3:-0}&day=${4:-0}" \
		--user-agent "$user_agent" \
		--header "content-type: application/json"
}
