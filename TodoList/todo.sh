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
echo "usage: todo [-h|--help] [-a|--add] [-l|--list]
           [-d|--done] [-e|--edit] [-nd|--not-done]
           [<args>]"
echo "usage: todo -it"


}

function add_todo() {
    echo "add todo"
    #numero_todo=$(( $numero_todo + 1 ))
    echo "-|"$1 >> "${database}"
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

function simple_list_todo() {
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
      flag=`echo ${todos[$todo]} | cut -d'|' -f1`
      if [[ $flag == '-' ]]; then
        echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
      fi
    done
}

function list_todos_done() {
    echo "====================="
    echo "==list done todos====="
    echo "====================="
    readarray -t todos < $database
    if [[ ${#todos[@]} -eq 0 ]]; then
      echo "no todo in the list"
    fi

    for todo in ${!todos[@]}; do
      flag=`echo ${todos[$todo]} | cut -d'|' -f1`
      if [[ $flag == '*' ]]; then
        echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
      fi
    done
}

function remove_todo() {
    echo "====================="
    echo "==delete a todo====="
    echo "====================="
    echo "remove : "`simple_list_todo ${1}`
    sed -i -e "${1}d" "$database"
    echo "todo removed succefly"

}

function edit_todo() {
    echo "====================="
    echo "== edit a todo====="
    echo "====================="
    echo $1
    echo $2
    readarray -t todos < $database
    if [[ ${#todos[@]} -eq 0 ]]; then
          echo "no todo in the list"
        fi

    for todo in ${!todos[@]}; do
      if [[ $(( $todo + 1 )) -eq $1 ]]; then
        flag=`echo ${todos[$todo]} | cut -d'|' -f1`
#        if [[ $flag == '-' ]]; then
#            echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
#        fi
         echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
         todos[$todo]=$flag"|"$2
         fi
    done

    rm $database
    for todo in ${!todos[@]}; do
       echo ${todos[$todo]} >> "${database}"
        done
}

function done_todo() {
    echo "====================="
        echo "== done a todo====="
        echo "====================="
        echo $1
        echo $2
        readarray -t todos < $database
        if [[ ${#todos[@]} -eq 0 ]]; then
              echo "no todo in the list"
            fi

        for todo in ${!todos[@]}; do
          if [[ $(( $todo + 1 )) -eq $1 ]]; then
            flag=`echo ${todos[$todo]} | cut -d'|' -f1`
    #        if [[ $flag == '-' ]]; then
    #            echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
    #        fi
             echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
             todos[$todo]="*|`echo ${todos[$todo]} | cut -d'|' -f2`"
             fi
        done

        rm $database
        for todo in ${!todos[@]}; do
           echo ${todos[$todo]} >> "${database}"
            done
}

function not_done_todo() {
    echo "====================="
            echo "== not done a todo====="
            echo "====================="
            echo $1
            echo $2
            readarray -t todos < $database
            if [[ ${#todos[@]} -eq 0 ]]; then
                  echo "no todo in the list"
                fi

            for todo in ${!todos[@]}; do
              if [[ $(( $todo + 1 )) -eq $1 ]]; then
                flag=`echo ${todos[$todo]} | cut -d'|' -f1`
        #        if [[ $flag == '-' ]]; then
        #            echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
        #        fi
                 echo "$(( $todo + 1 )) : `echo ${todos[$todo]} | cut -d'|' -f2`"
                 todos[$todo]="-|`echo ${todos[$todo]} | cut -d'|' -f2`"
                 fi
            done

            rm $database
            for todo in ${!todos[@]}; do
               echo ${todos[$todo]} >> "${database}"
                done
}

function init_numero_todo(){
  numero=`tail -n 1 $database | cut -d' ' -f1`
  echo $numero
}


function add_todo_intercative(){
  task_text=$(whiptail --title "menu todo list application" --inputbox \
          "Indiquez votre todo:" 20 80  3>&1 1>&2 2>&3 )
   add_todo $task_text
   sleep 3
   interactive_mode
}

function interactive_list_todos(){
  task_text=$(whiptail --title "menu todo list application" --textbox "$database" \
            --scrolltext 20 80  3>&1 1>&2 2>&3 )
  interactive_mode
}

function displya_menu(){
  menu=$(whiptail --title "menu todo list application" --menu \
        "Indiquez votre choix:" 20 80 9 \
        "1" "add" \
        "2" "list" \
        "3" "list todo by number" \
        "4" "remove" \
        "5" "done" \
        "6" "edit" \
        "7" "display-done" \
        "8" "not-done-todo" 3>&1 1>&2 2>&3)
        echo $menu
}
function interactive_mode(){
      echo "====================="
          echo "== todo app : interactive mode====="
          echo "====================="
 menu=`displya_menu`
#echo $menu
    if [[ $menu -eq 1 ]]; then
          add_todo_intercative
    elif [[ $menu -eq 2 ]]; then
          interactive_list_todos
#          sleep 2
#          interactive_mode
    elif [[ $menu -eq 3 ]]; then
          list_todo "$1"
    elif [[ $menu -eq 4 ]]; then
          remove_todo "$2"
    elif [[ $menu -eq 5 ]]; then
          done_todo "$2"
    elif [[ $menu -eq 6 ]]; then
          edit_todo "$2" "$3"
    elif [[ $menu -eq 7 ]]; then
            list_todos_done
    elif [[ $menu -eq 8 ]]; then
          not_done_todo "$2"
    elif [[ $menu -eq 9 ]]; then
              interactive_mode "$*"
    fi


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
    -dd|--display-done) menu=7;;
    -nd|--not-done) menu=8;;
    -it) menu=9;;
      *) menu=0;;
esac
#   TODO si le menu est deferent de 0-6 j'afficher le help
#echo $menu
if [[ $menu =~ ^[0-9]$ ]]; then
    if [[ $menu -eq 0 ]]; then
      display_help
    elif [[ $menu -eq 1 ]]; then
          add_todo "$2"
    elif [[ $menu -eq 2 ]]; then
          list_todos
    elif [[ $menu -eq 3 ]]; then
          list_todo "$1"
    elif [[ $menu -eq 4 ]]; then
          remove_todo "$2"
    elif [[ $menu -eq 5 ]]; then
          done_todo "$2"
    elif [[ $menu -eq 6 ]]; then
          edit_todo "$2" "$3"
    elif [[ $menu -eq 7 ]]; then
            list_todos_done
    elif [[ $menu -eq 8 ]]; then
          not_done_todo "$2"
    elif [[ $menu -eq 9 ]]; then
              interactive_mode "$*"
    fi

else
  display_help
fi