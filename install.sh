#!/bin/bash
function install_brew {
    if ! type brew > /dev/null; then
        echo "Install Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
}

function install_basictex {
    echo "Install basictex"
    brew tap caskroom/cask
    brew cask install basictex
    sudo tlmgr update --self
    sudo tlmgr install collection-fontsrecommended
    sudo tlmgr install biblatex
    sudo tlmgr install logreq
    sudo tlmgr install xstring
}

function install_tool {
    brew install entr
}

function download_ieeecof {
    echo "Download ieeeconf.cls"
    curl "http://css.paperplaza.net/conferences/support/files/ieeeconf.cls" -o ieeeconf.cls
}

function main {
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
        echo "Unsupported OS"
	elif [[ "$OSTYPE" == "darwin"* ]]; then
        install_brew
        install_basictex
        install_tool
        download_ieeecof
	else
        echo "Unsupported OS"
	fi
}

main "$@"
