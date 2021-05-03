pragma solidity >=0.4.22 <0.6.0;

contract simple {
    mapping(string => int) private accounts;

    function open(string memory acc_id, int amount) public payable {
        require(int(msg.value) == amount, 'No commitment made by the caller.');
        accounts[acc_id] = amount;
    }

    function query(string memory acc_id) public view returns (int amount) {
        amount = accounts[acc_id];
    }

    function transfer(string memory acc_from, string memory acc_to, int amount) public {
        require(msg.sender == 0xc0A8e4D217eB85b812aeb1226fAb6F588943C2C2, "The sender is wrong.");
        accounts[acc_from] -= amount;
        accounts[acc_to] += amount;
    }
}
