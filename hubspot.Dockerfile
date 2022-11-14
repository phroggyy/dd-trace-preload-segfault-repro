FROM registry.gitlab.com/jobilla/backend-services/hubspot:9e2ecbafd43a86540ddfc430ce89d230aa947dd0

# ENV USE_ZEND_ALLOC=0
RUN apk add valgrind
