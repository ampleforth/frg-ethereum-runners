echo "------Setting up environment"

echo "------Installing truffle"
npm install -g truffle@4.1.13

echo "------Installing ganache"
npm install -g ganache-cli@6.1.0

echo "------Installing geth"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install software-properties-common
  sudo add-apt-repository -y ppa:ethereum/ethereum
  sudo apt-get update
  sudo apt-get install ethereum
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew tap ethereum/ethereum
  brew install ethereum
fi
