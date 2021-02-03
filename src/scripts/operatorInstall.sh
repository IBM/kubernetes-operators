#!/bin/sh

# First parameter should be the Operator version string, setting default value
RELEASE_VERSION="${1:-v1.3.0}"

ARCH=$(case $(arch) in x86_64) echo -n amd64 ;; aarch64) echo -n arm64 ;; *) echo -n $(arch) ;; esac)
ARCH=${ARCH/i386/amd64}
OS=$(uname | awk '{print tolower($0)}')
FLAVOR=${OS}_${ARCH}
                    
OPERATOR_SDK_URL="https://github.com/operator-framework/operator-sdk/releases/download"

echo -e "\nDownloading operaror-sdk-$RELEASE_VERSION-$FLAVOR ...\n"
curl -LO ${OPERATOR_SDK_URL}/${RELEASE_VERSION}/operator-sdk_${FLAVOR}
echo -e "\noperaror-sdk-$RELEASE_VERSION-$FLAVOR downloaded.\n"
ls -al operator-sdk_${FLAVOR}
echo -e "\nInstalling operaror-sdk-$RELEASE_VERSION-$FLAVOR\n"
#chmod +x operator-sdk_${FLAVOR} && sudo mv operator-sdk_${FLAVOR} /usr/local/bin/operator-sdk

chmod +x operator-sdk_${FLAVOR} && mkdir -p ./bin && mv operator-sdk_${FLAVOR} ./bin/operator-sdk

echo -e "Checking prereqs version ...\nGo version:"
go version
echo -e "-----------------------------\nHelm version:"
helm version
echo -e "-----------------------------\nOperator-sdk version:"
./bin/operator-sdk version
#echo -e "-----------------------------\nAnsible operator version:"
#ansible-operator version
#echo -e "-----------------------------\nHelm operator Version:"
#helm-operator version
