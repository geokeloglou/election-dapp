pragma solidity ^0.5.0;

contract Election {
  // Candidate's model
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  //hashing [key:value] pair (account:boolean)
  mapping(address => bool) public voters;
  //declare public gives getter function
  //hashing [key:value] pair (id:struct)
  mapping(uint => Candidate) public candidates;

  uint public candidatesCount;

  event votedEvent(uint indexed _candidateId);

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

  function vote(uint _candidateId) public {
    // require that haven't voted before
    require(!voters[msg.sender]);
    
    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);
    // if execution stopped, gas will be refunded to the sender
    
    // we set msg.sender -> account => true
    // record that voter has voted
    voters[msg.sender] = true;

    // update candidate vote count
    candidates[_candidateId].voteCount++;

    // trigger voted event
    emit votedEvent(_candidateId);
  }
}