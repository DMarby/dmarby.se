---
title: Lorem Picsum, death by a million pixel-gigabits
date: 2019-08-11
layout: post
---

Or how to serve half a billion placeholder images a month on a budget.

[Lorem Picsum](https://picsum.photos) is one of the most popular placeholder sites on the internet. It started as a small side project written in NodeJS [five years ago](https://github.com/DMarby/picsum-photos/commit/a444d8d3f235c877ac3e3302d04de42388d6d619) to cover my own needs and has since gone through several iterations as it has grown. In this post, I'll be going through the architecture and inner-workings of it.
<!-- more -->

## Challenges
Processing images is very CPU intensive. As Lorem Picsum runs on a very small budget, to cope with all the requests as the service became more popular, we wanted to avoid doing so as much as possible. This meant adding caching to multiple layers of the architecture. We added two separate layers of caching: A CDN in front, as well as a second cache layer using [Varnish Cache](https://varnish-cache.org/).
To make the image processing as efficient as possible, we decided to use [libvips](https://libvips.github.io/libvips/), as it's very fast and resource-efficient.

As part of making Lorem Picsum as easy to use as possible, we've never required any registration, API keys, or enforced any usage limits.
This has generally worked out well, but once in a while a high traffic site deploys production code calling our API, usually accidentally, which leads to two main problems:
- Extreme load on the service: One site used Lorem Picsum for fallback images when they failed to serve an image. At some point, their image service broke, leading to several hundred millions of requests per month hitting Lorem Picsum, without them noticing. They were however very quick in rectifying this error once we contacted them.
- Privacy concerns. In the past, some sites have included an image from Lorem Picsum on every page in production, leaking user information and activity through the URL in the Referral header.

While we allow the use of Lorem Picsum for pretty much anything, when someone has used the service to the point of instability/very high load, we've tried to contact them and ask them to stop. This has generally worked out well, and in most cases the usage was accidental. However, in a few cases, we've gotten no responses to such attempts, which lead to us needing to block the sites in our cache layer.

## Architecture
<br/>

![img](../../images/lorem-ipsum-architecture.svg){.zoomable}

Lorem Picsum is designed to be stateless, and runs on top of [Kubernetes](https://kubernetes.io/). The overall system consists of a few different components, as can be seen in the diagram above.

When a user requests an image, the request starts at our CDN. Upon a CDN cache miss, the request continues to our [load balancer](#load-balancer) where it is forwarded to our [cache layer](#caching) which, upon cache miss, passes it on to the [application](#application). 
The [application](#application) verifies that the requested image exists in the [image database](#image-database), and checks if the image is cached by the [image storage cache](#image-storage-cache). If not, it fetches it from the [image storage](#image-storage), processes the image and returns it to the user.

#### Load balancing
We use [DigitalOcean's load balancer](https://www.digitalocean.com/products/load-balancer/) to handle incoming requests and pass them on to our cache layer.

#### Caching
To reduce the load on the system, on top of the caching provided by our CDN, we use [Varnish Cache](https://varnish-cache.org/) to cache processed images.
This also allows us to cache more efficiently by using optimizations, such as rewriting query parameters.

#### Application
The Lorem Picsum application, written in [Go](https://golang.org/), is responsible for processing images and serving up files for the website.
The website is statically generated during build-time using [Gulp](https://gulpjs.com/).

#### Image database
To store information about the images, such as width and height, we use [PostgreSQL](https://www.postgresql.org/). We use [DigitalOcean's managed databases](https://www.digitalocean.com/products/managed-databases) to avoid having to maintain and scale it ourselves.

#### Image storage
We use an object storage to store the source images, namely [DigitalOcean Spaces](https://www.digitalocean.com/products/spaces/).

#### Image storage cache
We store all source images in [Redis](https://redis.io/) to avoid fetching them from the image storage on every request.

## Orchestration
We use [Terraform](https://www.terraform.io/) for orchestration; to set up and configure all the services on DigitalOcean.
This allows any changes to be versioned in the git repo and makes it easy to re-create the environment if needed.

## Open source
Lorem Picsum is fully open source and licensed under MIT. 
Source code and documentation can be found in the [GitHub repo](https://github.com/DMarby/picsum-photos).

## Thanks
Lorem Picsum wouldn't exist without the support of [DigitalOcean](https://www.digitalocean.com). 
Big thanks to them for providing the infrastructure for Picsum for the past four years.
