// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

// public addresses for testing
// 1. 0x161aBA4657174De9a36C3Ee71bC8163118d88d43
// 2. 0x19c9FD8cDd9Cb7bae5cc85e1f461BC4dD43e2f06
// 3. 0x2238100EDc423056e23175e29b254f3074850ec4

contract TokenCreation {

    // public variables here (state variables)
    string public tokenName = "Ether";
    string public tokenAbbrv = "Eth";
    uint public totalSupply;

    // mapping variable here
    mapping(address => uint) public balanceOfAddresses;

    // mint function
    // mapped the address to the value.
    function mintToken(address _contributor, uint _amount) public {
        // checking if the address is already present or not.
        if(balanceOfAddresses[_contributor] == 0){ // doesn't already present and add it to the mapping.
            balanceOfAddresses[_contributor] = _amount;
        }else{
            balanceOfAddresses[_contributor]+=_amount;
        }
        totalSupply+=_amount;
    }

    // burn function

    function burnToken(address _contributor, uint _amount) public {
        if(balanceOfAddresses[_contributor] >= _amount){
            balanceOfAddresses[_contributor] -= _amount;
            totalSupply-=_amount;
        }
    }

    //setters for tokenName & tokenAbbrv
    function setTokenName(string memory _tokenName) public{
        tokenName = _tokenName;
    }
    function setTokenAbbrv(string memory _tokenAbbrv) public{
      tokenAbbrv = _tokenAbbrv;
    }

}
