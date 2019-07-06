var Election = artifacts.require("./Election.sol");
/* artifacts: contract abstraction that is specific to truffle
that gives us election artifact that represents smart contract
and truffle will expose this so we can interact with any case 
we want to like console, tests, using front-end app*/

module.exports = function(deployer) {
  deployer.deploy(Election);
};