pragma solidity ^0.5.0;

contract Election {
  // Candidate's model
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  mapping(uint => Candidate) public candidates;
  //declare public gives getter function
  //hashing [key:value] pair (id:struct)

  uint public candidatesCount;

  constructor() public {
    /* public because constructor is going to run 
    when we deploy our contract to the blockchain */
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate(string memory _name) private {
    candidatesCount++;
    // mapping(id:Candidate(struct))
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
  
}