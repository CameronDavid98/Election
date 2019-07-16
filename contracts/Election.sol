pragma solidity ^0.5.8;

contract Election{

    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voters;

    uint public candidatesCount;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
        addCandidate("Candidate 3");
    }

    function addCandidate(string memory _name) private{
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        //require that they haven't voted before
        require(!voters[msg.sender], "Voter has already voted");

        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate id");

        //record that voter has voted
        voters[msg.sender] = true;
        //update vote count
        candidates[_candidateId].voteCount ++;
    }
}

