pragma solidity ^0.4.2;

contract Election {

	struct Candidate {
		uint id;
		string name;
		uint voteCount;
	}

	// mapping(key => value)
		// key CAN'T be:
			// mapping
			// dynamically sized array
			// contract
			// enum
			// struct
	
	// Store & fetch candidates
	mapping(uint => Candidate) public candidates;

	uint public candidatesCount;

	// Store accounts that have voted
	mapping(address => bool) public voters;

	function Election() public{
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	function addCandidate(string _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

	function vote (uint _candidateID) public {
		// require that they haven't voted before
		require(!voters[msg.sender]);

		// require a valid candidate
		require(_candidateID > 0 && _candidateID <= candidatesCount);

		// record that voter has voted
		voters[msg.sender] = true;

		// update candidate vote count
		candidates[_candidateID].voteCount ++;
	}
}
