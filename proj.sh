#!/usr/bin/env bash

# A shell script written by {Dante,Claire} Falzone for creating a new project.

# usage: proj new <name of project> <file handle for desired language>

proj() {
    $open_com;
    $close_com;

    # Starting with the "new" command; I might want to make more commands later
    if [[ $1 == "new" ]]; then
        # project has a name?
        if [[ -n $2 ]]; then
            # file handle for the project's language specified?
            if [[ -n $3 ]]; then
                if [[ ! -d $2 ]]; then
                    mkdir $2;
                fi
                cd $2;
                mkdir src;
                mkdir doc;
                wget -O LICENSE https://www.gnu.org/licenses/gpl-3.0.txt;
                printf "# %s\n\nLicensed under GNU GPL 3.0" $2 > readme.txt;
                if [[ $3 == "sh" || $3 == "py" ]]; then
                    open_com="#";
                    close_com="";
                else
                    if [[ $3 == "asm" ]]; then
                        open_com=";";
                        close_com="";
                    else
                        open_com="/*";
                        close_com="*/";
                    fi
                fi

                if [[ $3 == "sh" || $3 == "py" || $3 == "asm" ]]; then
                    printf "\
$open_com          main.$3 file of $2\n\
$open_com    Copyright (C) 2019  Dante Falzone\n\
$open_com\n\
$open_com    This program is free software: you can redistribute it and/or modify\n\
$open_com    it under the terms of the GNU General Public License as published by\n\
$open_com    the Free Software Foundation, either version 3 of the License, or\n\
$open_com    (at your option) any later version.\n\
$open_com\n\
$open_com    This program is distributed in the hope that it will be useful,\n\
$open_com    but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
$open_com    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n\
$open_com    GNU General Public License for more details.\n\
$open_com\n\
$open_com    You should have received a copy of the GNU General Public License\n\
$open_com    along with this program.  If not, see <https://www.gnu.org/licenses/>." > src/main.$3;
                else
                    printf "$open_com\
          main.$3 file of $2\n\
    Copyright (C) 2019  Dante Falzone\n\
\n\
    This program is free software: you can redistribute it and/or modify\n\
    it under the terms of the GNU General Public License as published by\n\
    the Free Software Foundation, either version 3 of the License, or\n\
    (at your option) any later version.\n\
\n\
    This program is distributed in the hope that it will be useful,\n\
    but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n\
    GNU General Public License for more details.\n\
\n\
    You should have received a copy of the GNU General Public License\n\
    along with this program.  If not, see <https://www.gnu.org/licenses/>.\n\
$close_com" > src/main.$3;
                fi

            # no file handle specified for the language?
            else
                echo "no file handle specified; I don't know what suffixes you want on the names of your source files";
                echo "usage: proj new <name of project> <file handle for desired language>";
            fi

        # no name given for the project?
        else
            echo "no project name specified";
            echo "usage: proj new <name of project> <file handle for desired language>";
        fi

    # invalid command for proj.sh?
    else
        echo "$1 is not a proj command";
        echo "usage: proj new <name of project> <file handle for desired language>";
    fi
}
