echo "------Setting up environment"

echo "------Installing truffle"
npm install -g truffle

echo "------Installing ganache"
npm install -g ganache-cli

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
