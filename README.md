# Actions Demo
![](https://github.com/JackOHara/actions-demo/workflows/End%20to%20End%20Tests/badge.svg)
![](https://github.com/JackOHara/actions-demo/workflows/Deployment/badge.svg)

## Environment

Create a `.env` file in the root of the project

```bash
PORT=3000
```

## Docker

Run docker commands from root of project:

*Development*
* docker-compose up

**Note:** 

Nodemon will restart the application on each save. Port 9229 has been exposed to attach the node debugger.

*Build (Locally)*
* `docker build -t actions-demo:test --target test .`
* `docker build -t actions-demo:prod --target prod .`

*Run (Locally)*
* `docker run --rm -t actions-demo:test`
* `docker run --rm -p 3000:3000 -t actions-demo:prod`

## Husky / Commit

If hooks are not running run `npm rebuild`. Commit messages following [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)

* `git commit`


## Try Actions yourself
[GitHub Actions documentation](https://docs.github.com/en/actions)

[Explore Actions available in the Marketplace](https://github.com/marketplace?type=actions)

[Set up a Fargate deployment action](https://aws.amazon.com/blogs/opensource/github-actions-aws-fargate/)

