function audible_convert
    1password_session
    set --local AUDIBLE_AUTHENTICATION_CODE (op get item 'Amazon store' | jq --raw-output '.details.sections[0].fields[1].v')

    set --local AAX_FILE_TO_CONVERT $argv[1]
    set --local AUDIBLE_CONVERT_SCRIPT_URL https://raw.githubusercontent.com/KrumpetPirate/AAXtoMP3/master/AAXtoMP3

    wget --quiet --output-document=/tmp/audible_convert_script $AUDIBLE_CONVERT_SCRIPT_URL
    bash /tmp/audible_convert_script --authcode $AUDIBLE_AUTHENTICATION_CODE --single $AAX_FILE_TO_CONVERT
end
