# hiroara/solr repo

## Get started

    $ docker run -it hiroara/solr

## Pulling from private repository

If you want to use your solr\_home, please try to run a container using following command.

    $ docker run -it -v /path/to/your/solr/home:/solr_home hiroara/solr
