pragma solidity ^0.5.0;

contract Election {
    // Store candidate
    // Read candidate
    string public candidate; // declare public gives getter function
    // Constructor
     constructor() public {
        /* public because constructor is going to run 
        when we deploy our contract to the blockchain */
        candidate = "Candidate 1";
        /* state variable: accesible inside of contract,
        represent data that belongs to entire contract */
    }

}