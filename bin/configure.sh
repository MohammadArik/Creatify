#!/bin/bash

main_dir=`which creatify`
if [[ $main_dir == "" ]]
then
    main_dir="$PWD" 
else
    IFS='/' read -ra ADDR <<< "$main_dir"
    main_dir=""
    for i in "${!ADDR[@]}"; do
        x=$((${#ADDR[@]}-$i-1))
        [[ $x != 0 && $i != 0 ]] && main_dir="$main_dir/${ADDR[i]}" || :
    done
fi
[[ -e "$main_dir/creatify" ]] && : || main_dir="$PWD$main_dir"

github_file="$main_dir/github.pyc"
creds_file="$main_dir/creds.sh"
cli_based_creatify="$main_dir/GithubCLI-based_Creatify/creatify"
selenium_based_creatify="$main_dir/Webscraping-based_Creatify/creatify"
main_creatify="$main_dir/creatify"


function configGithub(){
    read -p "Your Github Email: " uid
    read -p "Your Github Password: " pass
    
    if [[ -e "$github_file" ]]; then
        rm "$github_file"
    fi
    cd "$main_dir"
    touch "github.pyc"
    echo "$uid" >> "$github_file"
    echo "$pass" >> "$github_file"
}

function configCLI(){
    read -p "Will you consider using web-scraping instead of github-cli? (y/n) " ANSWER
    case "$ANSWER" in 
    [yY] | [yY][eE][sS])
        configGithub
        if [[ -e "$main_creatify" ]]
        then
            rm "$main_creatify"
        fi
        touch "$main_creatify"
        cp "$selenium_based_creatify" "$main_dir"
        ;;
    [nN] | [nN][oO])
        echo "You need to configure the CLI if not done yet"
        gh auth login
        if [[ -e "$main_creatify" ]]
        then
            rm "$main_creatify"
        fi
        cp "$cli_based_creatify" "$main_dir"
        
        ;;
    *)
        echo "Please enter y/yes or n/no"
        configCLI
        ;;
    esac
    chmod u+x "$main_creatify"
    
}

function configEditor(){
    read -p "Command to start your desired editor(without directory related things): " editor
    if [[ -e "$creds_file" ]]
    then
        # . "$creds_file"
        # _python="$python"
        # _flutter="$flutter"
        # _node="$node"
        # _web="$web"
        # _default="$default"
        echo "hi"
        rm "$creds_file"

    fi
    # touch "$creds_file"
    printf "#!/bin/bash \npython=\"$_python\" \nflutter=\"$_flutter\" \nweb=\"$_web\" \nnode=\"$_node\" \ndefault=\"$_default\"\neditor=\"$editor\"" >> "$creds_file"
}

function configPath(){
    workflows_supported=( "python" "flutter" "web" "node" )

    for i in ${workflows_supported[@]}
    do
        read -p "Will you use $i? (y/n) " ANSWER
        case "$ANSWER" in 
        [yY] | [yY][eE][sS])
            eval "$i=1"
            ;;
        [nN] | [nN][oO])
            eval "$i=0"        
            ;;
        *)
            echo "Only yes and no are acceptable your response is taken as negative"
            eval "$i=0"
            ;;
        esac
    done
    workflows_supported=( "python" "flutter" "web" "node" "default" )
    default="1"
    echo "Please \"Absolute Paths\" to respective project directories.."
    for i in ${workflows_supported[@]}
    do
        [[ $i == "default" ]] && printf "There is an option for adding another directory to create empty projects..\nCreatify uses it when no specified language given.\nYou have to give a default path...\n" || :
        eval "x="\$$i""
        while [[ $x -eq "1" ]]
        do
            read -p "Path to your $i projects directory: " tempPath
            if [[ $tempPath == "" ]]
            then
                echo "Please don't leave it empty..."
            elif cd "$tempPath" > /dev/null 2>&1
            then
                eval "${i}=\"$tempPath\""
                break
            else
                echo "The path you given was not valid. Please enter a valid path."
            fi 
        done  
    done

    if [[ -e "$creds_file" ]] 
    then
        . "$creds_file"
        _editor="$editor"
        rm -r "$creds_file"
        echo "hello"
    fi
    touch "$creds_file"
    printf "#!/bin/bash \npython=\"$python\" \nflutter=\"$flutter\" \nweb=\"$web\" \nnode=\"$node\" \ndefault=\"$default\"\neditor=\"$_editor\"" >> "$creds_file"

}

# if [[ "$1" != "" ]]
# then
#     if [[ "$1" == "path" ]]
#     then
#         configPath
#     elif [[ "$1" == "remoterepo" ]]
#     then
#         configCLI
#     elif [[ "$1" == "github" ]]
#     then
#         configGithub
#     elif [[ "$1" == "dataFile" ]]
#     then
#         echo "Your file containing Github credentials is missing please configure it again.."
#         configGithub
#     elif [[ "$1" == "credsFile" ]]
#     then
#         echo "Your file containing required credentials is missing please configure it again.."
#         configPath
#     elif [[ "$1" == "firstTimeUsed" ]]
#     then
#         echo "Thanks for choosing Creatify.."
#         echo "As you are it for the first time let's configure some things"
#         configCLI
#         configPath
#         echo "You are all done.. Now you can use creatify.. Don't forget to give a star in \"https://www.github.com/MohammadArik/creatify\""
#     else
#         echo "$1 is not a valid option"
#     fi
# else
#     configCLI
#     configPath
# fi

# configPath
configEditor
