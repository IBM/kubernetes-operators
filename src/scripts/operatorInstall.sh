#!/bin/sh


#Install Go
wget "https://golang.org/dl/go1.17.2.linux-amd64.tar.gz" &&
mkdir -p ${HOME}/bin &&
tar -C ${HOME}/bin -xzf go1.17.2.linux-amd64.tar.gz

export PATH=$PATH:${HOME}/bin/go/bin:${HOME}/bin

go --version


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

#Install operator SDK in the user/local/bin
#chmod +x operator-sdk_${FLAVOR} && sudo mv operator-sdk_${FLAVOR} /usr/local/bin/operator-sdk

#Install operator SDK in the user's home directory
chmod +x operator-sdk_${FLAVOR} && mkdir -p ${HOME}/bin && mv operator-sdk_${FLAVOR} ${HOME}/bin/operator-sdk

echo -e "Checking prereqs version ...\nGo version:"
go version
echo -e "-----------------------------\nHelm version:"
helm version
echo -e "-----------------------------\nOperator-sdk version:"
${HOME}/bin/operator-sdk version

operator-sdk version


export PATH=$PATH:${HOME}/bin/go/bin:${HOME}/bin

#echo -e "-----------------------------\nAnsible operator version:"
#ansible-operator version
#echo -e "-----------------------------\nHelm operator Version:"
#helm-operator version
