## terraform-multi-env-gh-workflow

This repo contains terraform code that uses a S3 backend created using
the [terraform-aws-s3backend](https://github.com/TuftsUniversity/terraform-multi-env-gh-workflow)
project. Make sure you have run that code first before using this.

## Manual Usage

Make you have setup the necessary pieces for the backend.
If you look at the `main.tf` you'll there we define a s3 backend for terraform. You have to use
the values from the output when running the [terraform-aws-s3backend](https://github.com/TuftsUniversity/terraform-multi-env-gh-workflow)
code:

- bucket
- role_arn
- dynamodb_table

You want to also change the key attribute, that will determine to use within the bucket.
In this tf code, we just create an ec2 instance. The only variable we setup is the region (see the envs dir).
We have two files there, one for the dev environment and another one for prod.

```sh
$ make tf/init
$ make tf/workspace/new/dev
# Now tf will work in the dev workspace
$ terraform apply -var-file=./envs/dev.tfvars -auto-approve

# For prod
$ make tf/workspace/new/prod
$ terraform apply -var-file=./envs/prod.tfvars -auto-approve
```

## The GH workflow

But you don't want to push changes to your infrastructure manually.
This repo has a GH workflow that will run those commands above on commits to either
the main branch or the dev branch.
