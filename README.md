# AWS SDK for PHP Lambda Layer

[![pipeline status](https://gitlab.com/coldfusionjp/aws-sdk-php-lambda-layer/badges/master/pipeline.svg)](https://gitlab.com/coldfusionjp/aws-sdk-php-lambda-layer/commits/master)

The **AWS SDK for PHP Lambda Layer** provides packages of the latest releases of the [AWS SDK for PHP](https://github.com/aws/aws-sdk-php) directly from GitHub into a AWS Lambda layer.

## Quickstart

If you want to get started right away, you can simply use our layers directly with your lambda functions.  Choose an ARN below based on the version of the AWS SDK for PHP required by your application, and attach it as a layer to your lambda function:

* aws-sdk-php-3.110.11: `arn:aws:lambda:ap-northeast-1:568458425968:layer:aws-sdk-php-3_110_11:3` (1,965,218 bytes)

Currently we only provide the PHP Runtime Layers in the Tokyo (`ap-northeast-1`) region, but we'll expand this soon so they're available in all AWS regions.

For example code, please see the README in the [AWS Lambda PHP Runtime Layer](https://gitlab.com/coldfusionjp/aws-lambda-php-runtime#example-code) repository.

## License

The source code found in this repository is distributed by Cold Fusion, Inc. under the [MIT License](https://choosealicense.com/licenses/mit/), however the AWS SDK for PHP itself is distributed under the [Apache License 2.0](https://github.com/aws/aws-sdk-php/blob/master/LICENSE.md).

See [LICENSE](./LICENSE) for more information.
