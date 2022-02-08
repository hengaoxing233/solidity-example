// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExampleAcceptTokenContract{

    IERC20 myToken;
    address owner;

    constructor(address _tokenAddress){
        myToken = IERC20(_tokenAddress);
        owner = msg.sender;

    }

    function transferFrom(uint _amount) public{
        myToken.transferFrom(msg.sender,address(this),_amount);
    }

    function getBalance(address _address) public view returns(uint){
        return myToken.balanceOf(_address);
    }

    function kill() public{
        //销毁合约
        selfdestruct(payable(owner));
    }
}
