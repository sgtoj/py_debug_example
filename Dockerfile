# ------------------------------------------------------------------- build ---

FROM python:3-alpine as base

# directory for the app

RUN mkdir -p /opt/app

# add source

ADD ./ /opt/app

WORKDIR /opt/app
CMD [ "python", "./app/app.py" ]

# --------------------------------------------------------------------- dev ---

FROM base as dev

# installing additional development only dependencies

RUN pip install ptvsd

# ------------------------------------------------------------------- prod ---

FROM base