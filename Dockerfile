ARG BASE_IMAGE_TAG

FROM wodby/apache:${BASE_IMAGE_TAG}

COPY templates /etc/gotpl/