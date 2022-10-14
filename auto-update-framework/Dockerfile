FROM web-author-base

RUN apt-get update && apt-get -y install cron git

# Files needed for the cron job that updates the framework
COPY update-frameworks.sh /
COPY cron /etc/cron.d/cron 
RUN crontab /etc/cron.d/cron


# Run the command on container startup
COPY startup-wrapper.sh /
CMD ["/startup-wrapper.sh"]
