#!/bin/bash

# test: itunes prev

. $(dirname $0)/bash-tap-bootstrap
. "$BASH_TAP_ROOT/bash-tap-mock"
. $(dirname $0)/bash-itunes-test-functions
. $(dirname $0)/../itunes

plan tests $((8 + (1 * tests_per_track_displayed)))

function mock_osascript() {
    record_sent_command "$*"
    if [[ "$*" =~ 'of current track' ]]; then
        echo "$mock_track_1_data"
    elif [[ "$*" =~ 'player position' ]]; then
        echo "60"
    fi
}

# test: itunes prev
dispatch_mocked_command "prev"

is "$stderr" "" "stderr should be empty"
like "${sent_commands[0]}" 'previous track' "first sent command should contain 'previous track'"
like "${sent_commands[0]}" 'tell application "iTunes"' "first sent command should contain 'tell application \"iTunes\"'"
like "${sent_commands[1]}" 'of current track' "second sent command should be fetch of 'current track'"
like "${sent_commands[1]}" 'tell application "iTunes"' "second sent command should contain 'tell application \"iTunes\"'"
like "${sent_commands[2]}" 'player position as integer' "third sent command should contain 'player position as integer'"
like "${sent_commands[2]}" 'tell application "iTunes"' "third sent command should contain 'tell application \"iTunes\"'"

like "$stdout" "Skipping to previous track" "stdout should tell user that track is being skipped backwards"
test_track_displayed "$stdout" "mock_track_1" "stdout"
