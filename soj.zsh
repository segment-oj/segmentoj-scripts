#!/bin/zsh

while {getopts fblpd arg} {
    case $arg {
        (b)
            echo -e '\033[32m\033[1m[activate venv]\033[0m'
            source ./venv/bin/activate
            echo -e '\033[32m\033[1m[install requirements]\033[0m'
            pip install -r requirements.txt
            echo -e '\033[32m\033[1m[migrate]\033[0m'
            python manage.py migrate
            echo -e '\033[32m\033[1m[run test]\033[0m'
            python manage.py test
            echo -e '\033[32m\033[1m[run server]\033[0m'
            python manage.py runserver 0.0.0.0:8000
        ;;
        (f)
            echo -e '\033[32m\033[1m[install requirements]\033[0m'
            cnpm install
            echo -e '\033[32m\033[1m[lint]\033[0m'
            npm run lint
            npm run lint:css
            echo -e '\033[32m\033[1m[run server]\033[0m'
            npm run serve
        ;;
        (l)
            echo -e '\033[32m\033[1m[install requirements]\033[0m'
            cnpm install
            echo -e '\033[32m\033[1m[run server]\033[0m'
            npm run serve
        ;;
        (p)
            echo -e '\033[32m\033[1m[install requirements]\033[0m'
            cnpm install
            echo -e '\033[32m\033[1m[run server]\033[0m'
            npm run start
        ;;
        (d)
            echo -e '\033[32m[install requirements]\033[0m'
            cnpm install
            echo -e '\033[32m[run server]\033[0m'
            npm run start
        ;;
    }
}
