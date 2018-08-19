var _web3internal = {
  constract: null
};

function getWeb3Instance() {
  let web3 = window['web3'];
  if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
  } else {
    // set the provider you want from Web3.providers
    web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
  }
  return web3;
}

function getCoinbase() {
  return web3.eth.coinbase;
}

function getContract() {
  var web3 = getWeb3Instance();
  if (!web3.etsContract) {
    web3.etsContract = web3.eth.contract(ABI).at('0x6f06374a824e2e90517e3058bdca2671d6b4a192');
  }
  return web3.etsContract;
}

function transfer(to, value, callback) {
  const from = getCoinbase();
  value = value * 10 ** 18;
  console.log('transfer,', { to, value, from });
  web3.eth.sendTransaction({ to, value, from }, callback);
}

function donate(to, value, callback) {
  const from = getCoinbase();
  value = value * 10 ** 18;
  console.log('Donating,', { to, value, from });
  getContract().Donating.sendTransaction({ to, value, from }, callback);
}

// function Funding() payable public {
//   balance = msg.value;
//   emit funding(msg.value, balance);
// }

// function Donating() payable public OnlyOwner {
//   to.transfer(msg.value);
//   balance = msg.value;
//   emit DonationTo(to, msg.value);
//   assert(msg.value == 0);
// }

// function CheckMsg() payable public {
//   emit DonationMsg(msg.data, msg.sender, msg.value);
// }

const ABI = [
  {
    constant: false,
    inputs: [],
    name: 'Donating',
    outputs: [],
    payable: true,
    stateMutability: 'payable',
    type: 'function'
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        name: '_data',
        type: 'bytes'
      },
      {
        indexed: false,
        name: '_sender',
        type: 'address'
      },
      {
        indexed: false,
        name: '_value',
        type: 'uint256'
      }
    ],
    name: 'DonationMsg',
    type: 'event'
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        name: 'to',
        type: 'address'
      },
      {
        indexed: false,
        name: 'amount',
        type: 'uint256'
      }
    ],
    name: 'DonationTo',
    type: 'event'
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        name: '_value',
        type: 'uint256'
      },
      {
        indexed: false,
        name: '_balance',
        type: 'uint256'
      }
    ],
    name: 'funding',
    type: 'event'
  },
  {
    constant: false,
    inputs: [],
    name: 'Funding',
    outputs: [],
    payable: true,
    stateMutability: 'payable',
    type: 'function'
  },
  {
    inputs: [],
    payable: false,
    stateMutability: 'nonpayable',
    type: 'constructor'
  }
];
