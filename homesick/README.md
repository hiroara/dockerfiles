# hiroara/homesick repo

## Get started

    $ docker run -it -e HOMESICK_REPO=<URI_OF_YOUR_REPOSITORY> hiroara/homesick

## Pulling from private repository

If you want to pull dotfiles from your private repository.

    $ cp ~/.ssh/<YOUR_SSH_KEY> ./ssh/id_rsa
    $ docker run -it -e HOMESICK_REPO=<URI_OF_YOUR_REPOSITORY> -v `pwd`/ssh:/ssh hiroara/homesick
