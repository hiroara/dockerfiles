FROM ruby:2.1.5

ADD init_homesick.sh /tmp/init_homesick.sh
RUN chmod 755 /tmp/init_homesick.sh

ENTRYPOINT ["/tmp/init_homesick.sh"]

CMD ["/bin/bash"]
