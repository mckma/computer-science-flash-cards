FROM python:3.9
LABEL maintainer="Tinpee <tinpee.dev@gmail.com>"

ADD . /src
WORKDIR /src
RUN pip install --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org --upgrade pip \
    && pip install --trusted-host pypi.python.org --trusted-host pypi.org --trusted-host files.pythonhosted.org flask gunicorn

COPY entrypoint.sh /
RUN sed -i 's/\r$//' /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /src/db

EXPOSE 8000
CMD ["/entrypoint.sh"]
