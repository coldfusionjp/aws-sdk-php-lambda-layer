SDK_VERSION			:= 3.110.11

#------------------------------------------------------------------------

define lambdaLayerName
aws-sdk-php-$(subst .,_,$(1))
endef

#------------------------------------------------------------------------

.DELETE_ON_ERROR:

default: build/aws-sdk-php.zip
	aws lambda publish-layer-version --layer-name "$(call lambdaLayerName,$(SDK_VERSION))" --description "AWS SDK for PHP, packaged by Cold Fusion, Inc. For more details and version updates, see: https://gitlab.com/coldfusionjp/aws-sdk-php-lambda-layer" --license-info "For license info, see: https://gitlab.com/coldfusionjp/aws-sdk-php-lambda-layer#license" --zip-file fileb://$<

build/aws-sdk-php.zip:
	@mkdir -p $(dir $@)
	curl -L https://github.com/aws/aws-sdk-php/releases/download/$(SDK_VERSION)/aws.zip -o build/aws.zip
	cd build ; unzip -d aws-sdk-php ./aws.zip ; find . -type f ! -name '*.php' -delete ; zip -v -9 -r -D aws-sdk-php.zip aws-sdk-php/ ; rm -rf aws-sdk-php/

public-share:
	LAYER_LATEST_VERSION=`aws lambda list-layer-versions --layer-name "$(call lambdaLayerName,$(SDK_VERSION))" | jq -r '.LayerVersions[0].Version'` ; \
	aws lambda add-layer-version-permission --layer-name "$(call lambdaLayerName,$(SDK_VERSION))" --version-number "$${LAYER_LATEST_VERSION}" --principal "*" --statement-id "aws-sdk-php-public-share" --action lambda:GetLayerVersion

clean:
	rm -rf build
