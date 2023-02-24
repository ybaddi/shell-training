#!/bin/bash
#   script interactive -it
#   script en ligne de command
    # -a, --add ===> ajouter une todo
    # -l, --list ===> lister les todo
    # [numero] ===> liste todo of this number
    # -r, --remove ===> suprimer un todo
    # -d,--done ======> mettre une todo comme done
    # -e, --edit ======> modifier un todo
    # -h, --help ======> display help

database="$HOME/.todo/.database"

# Functions
function display_help() {
    echo "help"
}

function add_todo() {
    echo "add todo"
    numero_todo=$(( $numero_todo + 1 ))
    echo $1 >> "${database}"
    echo "todo added succefly"
}
function list_todo() {
    echo "====================="
    echo "==   list a todo ====="
    echo "====================="
    echo $1
    readarray -t todos < $database
    todo=${todos[$(( ${1} - 1 )) ]}
    if [[ -n $todo ]]; then
      echo "${1} : ${todos[$(( ${1} - 1 )) ]}"
    else
      echo "No Todo with this number, use -l|--list to display all todos"
    fi
}

function list_todos() {
    echo "====================="
    echo "==list all todos====="
    echo "====================="
    readarray -t todos < $database
    if [[ ${#todos[@]} -eq 0 ]]; then
      echo "no todo in the list"
    fi

    for todo in ${!todos[@]}; do
      echo "$(( $todo + 1 )) : ${todos[$todo]}"
    done
}

function remove_todo() {
    echo "help"
}

function edit_todo() {
    echo "help"
}

function done_todo() {
    echo "help"
}

function init_numero_todo(){
  numero=`tail -n 1 $database | cut -d' ' -f1`
  echo $numero
}



numero_todo=`init_numero_todo`
#echo $numero_todo

case "$1" in
    -h|--help) menu=0;;
    -a|--add)  menu=1;;
    -l|--list) menu=2;;
    *[0-9]*)   menu=3;;
    -r|--remove) menu=4;;
    -d|--done) menu=5;;
    -e|--edit) menu=6;;
esac
#   TODO si le menu est deferent de 0-6 j'afficher le help
echo $menu
if [[ $menu =~ ^[0-6]$ ]]; then
    if [[ $menu -eq 0 ]]; then
      display_help
    elif [[ $menu -eq 1 ]]; then
          add_todo "$2"
    elif [[ $menu -eq 2 ]]; then
          list_todos
    elif [[ $menu -eq 3 ]]; then
          list_todo "$1"
    elif [[ $menu -eq 4 ]]; then
          remove_todo
    elif [[ $menu -eq 5 ]]; then
          done_todo
    elif [[ $menu -eq 6 ]]; then
          edit_todo
    fi

else
  display_help
fi