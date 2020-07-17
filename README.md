# docker-kcptun
## description
### container config
- net=host
- cap-add=NET_ADMIN
- cap-add=NET_RAW
- eg:
  >docker run --net=host --cap-add=NET_ADMIN --cap-add=NET_RAW···
