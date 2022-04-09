# docker-nginx-cors-bypass

A docker nginx proxy to by pass CORS check.

## Description

When a frontend development environment is pointing to a backend that doesn't add the frontend as Allowed origin, an CORS error would throw to frontend like below:
<br/>

Access to XMLHttpRequest at $BACKEND from origin $FRONTEND has been blocked by CORS policy: Response to preflight request doesn't pass access control check: No 'Access-Control-Allow-Origin' header is present on the requested resource.
<br/>

This is a tool to proxy frontend request to backend to avoid such error for frontend development.

## Getting Started

### Dependencies

* Have docker installed.

### Build

```
docker build -t nginx-cors-bypass .
```

### Executing program


```
docker run -p $PROXY_PORT:80 -e TARGET=$TARGET -e ALLOW_ORIGIN=$ALLOW_ORIGIN -e FROM=$FROM --name nginx-cors-bypass nginx-cors-bypass
```
* $PROXY_PORT: the proxy port that the frontend connect to.
* $TARGET: the backend url. Please put / at the end of url so nginx will bypass the location from /.
* $ALLOW_ORIGIN: The origin url that the backend allowed.
* $FROM: The frontend url.


<br/>
An example:

* The backend is running on host on port 8087. So from the docker's point of view, the $TARGET would be http://host.docker.internal:8087/ (Note: the end of / is necessary)
* The backend was set to allow origin on a local server on host on port 8080, so the $ALLOW_ORIGIN would be http://localhost:8080
* The frontend is a npm server running on local with port 4200. So $FROM would be http://localhost:4200
* $PROXY_PORT is set to 8096. Therefore, for development the frontend request will send to http://localhost:8096

For this example
```
docker run -p 8096:80 -e TARGET=http://host.docker.internal:8087/ -e ALLOW_ORIGIN=http://localhost:8080 -e FROM=http://localhost:4200 --name nginx-cors-bypass nginx-cors-bypass
```



## License

This project is licensed under the MIT License - see the LICENSE.md file for details

