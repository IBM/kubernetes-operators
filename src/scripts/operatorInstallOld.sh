#!/bin/sh

# First parameter should be the Operator version string, setting default value
RELEASE_VERSION="${1:-v0.19.2}"
#RELEASE_VERSION="${1:-v1.0.0}"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
OS=${OS/darwin/apple-darwin}
OS=${OS/linux/linux-gnu}
ARCH=$(uname -m)
FLAVOR=${ARCH}-${OS}

echo -e "\nDownloading operaror-sdk-$RELEASE_VERSION-$FLAVOR ...\n"
curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/operator-sdk-${RELEASE_VERSION}-${FLAVOR}
echo -e "\noperaror-sdk-$RELEASE_VERSION-$FLAVOR downloaded.\n"
ls -al operator-sdk-$RELEASE_VERSION-$FLAVOR
echo -e "\nInstalling operaror-sdk-$RELEASE_VERSION-$FLAVOR\n"
chmod +x operator-sdk-${RELEASE_VERSION}-${FLAVOR} && sudo mkdir -p /usr/local/bin/ && sudo cp operator-sdk-${RELEASE_VERSION}-${FLAVOR} /usr/local/bin/operator-sdk && rm operator-sdk-${RELEASE_VERSION}-${FLAVOR}


echo -e "\nDownloading ansible-sdk-$RELEASE_VERSION-$FLAVOR ...\n"
curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/ansible-operator-${RELEASE_VERSION}-${FLAVOR}
echo -e "\nansible-operator-$RELEASE_VERSION-$FLAVOR downloaded.\n"
ls -al ansible-operator-$RELEASE_VERSION-$FLAVOR
echo -e "\nInstalling ansible-sdk-$RELEASE_VERSION-$FLAVOR\n"
chmod +x ansible-operator-${RELEASE_VERSION}-${FLAVOR} && sudo mkdir -p /usr/local/bin/ && sudo cp ansible-operator-${RELEASE_VERSION}-${FLAVOR} /usr/local/bin/ansible-operator && rm ansible-operator-${RELEASE_VERSION}-${FLAVOR}

echo -e "\nDownloading helm-sdk-$RELEASE_VERSION-$FLAVOR ...\n"
curl -LO https://github.com/operator-framework/operator-sdk/releases/download/${RELEASE_VERSION}/helm-operator-${RELEASE_VERSION}-${FLAVOR}
echo -e "\nhelm-sdk-$RELEASE_VERSION-$FLAVOR for macOS downloaded.\n"
ls -al helm-operator-$RELEASE_VERSION-$FLAVOR
echo -e "\nInstalling helm-operator-$RELEASE_VERSION-$FLAVOR\n"
chmod +x helm-operator-${RELEASE_VERSION}-${FLAVOR} && sudo mkdir -p /usr/local/bin/ && sudo cp helm-operator-${RELEASE_VERSION}-${FLAVOR} /usr/local/bin/helm-operator && rm helm-operator-${RELEASE_VERSION}-${FLAVOR}

echo -e "Checking prereqs version ...\nGo version:"
go version
echo -e "-----------------------------\nHelm version:"
helm version
echo -e "-----------------------------\nOperator-sdk version:"
operator-sdk version
#echo -e "-----------------------------\nAnsible operator version:"
#ansible-operator version
#echo -e "-----------------------------\nHelm operator Version:"
#helm-operator version
